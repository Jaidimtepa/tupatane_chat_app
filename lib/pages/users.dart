import 'package:flutter/material.dart';
import 'package:tupatane_chat_app/models/user_model.dart';
import 'package:tupatane_chat_app/models/message_model.dart';
import 'package:tupatane_chat_app/services/chat_service.dart';
import 'package:tupatane_chat_app/services/auth_service.dart';
import 'package:tupatane_chat_app/pages/chat.dart';
import 'package:tupatane_chat_app/pages/auth/login.dart';

class UsersPage extends StatefulWidget {
  final User user;
  const UsersPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Text(widget.user.username)),
          ),
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: _chatService.getUsersSortedByLastMessage(widget.user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users available'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final otherUser = users[index];
              return StreamBuilder<Message?>(
                stream: _chatService.getLastMessageStream(
                  widget.user.uid,
                  otherUser.uid,
                ),
                builder: (context, messageSnapshot) {
                  return ListTile(
                    title: Text(otherUser.username),
                    subtitle:
                        messageSnapshot.hasData && messageSnapshot.data != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageSnapshot.data!.content,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _formatTimestamp(
                                  messageSnapshot.data!.timestamp,
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          )
                        : const Text('No messages yet'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            currentUser: widget.user,
                            otherUser: otherUser,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final dt = timestamp.toLocal();
    final now = DateTime.now();
    final twoDigits = (int n) => n.toString().padLeft(2, '0');

    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      return "${twoDigits(dt.hour)}:${twoDigits(dt.minute)}";
    } else {
      return "${dt.day}/${dt.month}/${dt.year} ${twoDigits(dt.hour)}:${twoDigits(dt.minute)}";
    }
  }

  void _logout() async {
    await _authService.logout();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage(onSignupTap: () {})),
        (route) => false,
      );
    }
  }
}
