import 'package:firebase_database/firebase_database.dart';
import 'package:tupatane_chat_app/models/user_model.dart' as app_user;
import 'package:tupatane_chat_app/models/message_model.dart';

class ChatService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Get all users (except current user)
  Future<List<app_user.User>> getAllUsers(String currentUserId) async {
    try {
      final snapshot = await _database.ref('users').get();

      if (!snapshot.exists) return [];

      List<app_user.User> users = [];
      for (var child in snapshot.children) {
        final user = app_user.User.fromJson(
          Map<String, dynamic>.from(child.value as Map),
        );
        // Exclude current user
        if (user.uid != currentUserId) {
          users.add(user);
        }
      }
      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  // Stream to listen to users in real-time
  Stream<List<app_user.User>> getUsersStream(String currentUserId) {
    return _database.ref('users').onValue.map((event) {
      if (!event.snapshot.exists) return [];

      List<app_user.User> users = [];
      for (var child in event.snapshot.children) {
        final user = app_user.User.fromJson(
          Map<String, dynamic>.from(child.value as Map),
        );
        if (user.uid != currentUserId) {
          users.add(user);
        }
      }
      return users;
    });
  }

  // Get users sorted by last message timestamp
  Stream<List<app_user.User>> getUsersSortedByLastMessage(
    String currentUserId,
  ) {
    return _database.ref('users').onValue.asyncMap((event) async {
      if (!event.snapshot.exists) return [];

      List<app_user.User> users = [];
      for (var child in event.snapshot.children) {
        final user = app_user.User.fromJson(
          Map<String, dynamic>.from(child.value as Map),
        );
        if (user.uid != currentUserId) {
          users.add(user);
        }
      }

      // Sort users by last message timestamp
      final userTimestamps = <String, DateTime>{};
      for (var user in users) {
        final lastMessage = await _getLastMessageSnapshot(
          currentUserId,
          user.uid,
        );
        if (lastMessage != null) {
          userTimestamps[user.uid] = DateTime.parse(lastMessage['timestamp']);
        } else {
          // If no message, set to epoch (oldest)
          userTimestamps[user.uid] = DateTime.fromMillisecondsSinceEpoch(0);
        }
      }

      // Sort by timestamp descending (most recent first)
      users.sort((a, b) {
        final timeA =
            userTimestamps[a.uid] ?? DateTime.fromMillisecondsSinceEpoch(0);
        final timeB =
            userTimestamps[b.uid] ?? DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      });

      return users;
    });
  }

  // Helper method to get last message snapshot for sorting
  Future<Map<String, dynamic>?> _getLastMessageSnapshot(
    String userId1,
    String userId2,
  ) async {
    try {
      final chatId = _generateChatId(userId1, userId2);
      final snapshot = await _database
          .ref('messages/$chatId')
          .orderByChild('timestamp')
          .limitToLast(1)
          .get();

      if (!snapshot.exists) return null;

      // Get the last (and only) message from the snapshot
      for (var child in snapshot.children) {
        return Map<String, dynamic>.from(child.value as Map);
      }

      return null;
    } catch (e) {
      print('Error getting last message snapshot: $e');
      return null;
    }
  }

  // Send message
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String senderName,
    required String content,
  }) async {
    try {
      final messageId = _database.ref('messages/$chatId').push().key;

      final message = Message(
        messageId: messageId ?? '',
        chatId: chatId,
        senderId: senderId,
        senderName: senderName,
        content: content,
        timestamp: DateTime.now(),
      );

      await _database.ref('messages/$chatId/$messageId').set(message.toJson());
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  // Get messages for a chat
  Stream<List<Message>> getMessagesStream(String chatId) {
    return _database.ref('messages/$chatId').onValue.map((event) {
      if (!event.snapshot.exists) return [];

      List<Message> messages = [];
      for (var child in event.snapshot.children) {
        final message = Message.fromJson(
          Map<String, dynamic>.from(child.value as Map),
        );
        messages.add(message);
      }
      // Sort by timestamp
      messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return messages;
    });
  }

  // Get the last message for a chat
  Stream<Message?> getLastMessageStream(String userId1, String userId2) {
    final chatId = _generateChatId(userId1, userId2);
    return _database
        .ref('messages/$chatId')
        .orderByChild('timestamp')
        .limitToLast(1)
        .onValue
        .map((event) {
          if (!event.snapshot.exists) return null;

          final children = event.snapshot.children.toList();
          if (children.isEmpty) return null;

          try {
            final messageData = Map<String, dynamic>.from(
              children.last.value as Map,
            );
            return Message.fromJson(messageData);
          } catch (e) {
            print('Error parsing last message: $e');
            return null;
          }
        });
  }

  // Generate chat ID from two user IDs
  String _generateChatId(String userId1, String userId2) {
    final uids = [userId1, userId2]..sort();
    return uids.join('_');
  }
}
