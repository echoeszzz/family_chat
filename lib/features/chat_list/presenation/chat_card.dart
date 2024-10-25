import 'package:family_locator/features/chat_list/data/chat_card_model.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;

  const ChatCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.avatarUrl),
        radius: 30,
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(chat.lastMessage),
      trailing: Text(chat.time),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/chat',
          arguments: chat,
        );
      },
    );
  }
}