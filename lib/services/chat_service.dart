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
    return _database.ref('messages/$chatId').onValue.map((event) {
      if (!event.snapshot.exists) return null;

      List<Message> messages = [];
      for (var child in event.snapshot.children) {
        final message = Message.fromJson(
          Map<String, dynamic>.from(child.value as Map),
        );
        messages.add(message);
      }

      if (messages.isEmpty) return null;

      // Sort by timestamp and get the last one
      messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return messages.first;
    });
  }

  // Generate chat ID from two user IDs
  String _generateChatId(String userId1, String userId2) {
    final uids = [userId1, userId2]..sort();
    return uids.join('_');
  }
}
