class Chat {
  final String chatId;
  final String user1Id;
  final String user2Id;
  final String user1Name;
  final String user2Name;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final int unreadCount;

  Chat({
    required this.chatId,
    required this.user1Id,
    required this.user2Id,
    required this.user1Name,
    required this.user2Name,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount = 0,
  });

  // Convert Chat to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'user1Id': user1Id,
      'user2Id': user2Id,
      'user1Name': user1Name,
      'user2Name': user2Name,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime?.toIso8601String(),
      'unreadCount': unreadCount,
    };
  }

  // Create Chat from Firestore document
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chatId'] as String,
      user1Id: json['user1Id'] as String,
      user2Id: json['user2Id'] as String,
      user1Name: json['user1Name'] as String,
      user2Name: json['user2Name'] as String,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: json['lastMessageTime'] != null
          ? DateTime.parse(json['lastMessageTime'] as String)
          : null,
      unreadCount: json['unreadCount'] as int? ?? 0,
    );
  }
}
