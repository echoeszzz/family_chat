import 'package:family_locator/features/chat_list/data/chat_card_model.dart';
import 'package:family_locator/features/chat_list/presenation/chat_card.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<ChatModel> chatList = [
    ChatModel(
      name: "Alice",
      lastMessage: "Hey! How are you?",
      time: "10:30 AM",
      avatarUrl:
          "https://www.diamondartclub.com/cdn/shop/files/inspector-gadget"
          "-diamond-art-painting-34301116842177.jpg?v=1688993351&width=3000",
    ),
    ChatModel(
      name: "Bob",
      lastMessage: "Let's catch up later.",
      time: "09:15 AM",
      avatarUrl:
          "https://www.diamondartclub.com/cdn/shop/files/inspector-gadget"
          "-diamond-art-painting-34301116842177.jpg?v=1688993351&width=3000",
    ),
    ChatModel(
      name: "Charlie",
      lastMessage: "I sent you the documents.",
      time: "08:45 AM",
      avatarUrl:
          "https://www.diamondartclub.com/cdn/shop/files/inspector-gadget"
          "-diamond-art-painting-34301116842177.jpg?v=1688993351&width=3000",
    ),
  ];

  void _addNewChat() {
    setState(() {
      chatList.add(
        ChatModel(
          name: "New Chat",
          lastMessage: "This is a new message",
          time: "Now",
          avatarUrl:
              "https://www.diamondartclub.com/cdn/shop/files/inspector-gadget"
              "-diamond-art-painting-34301116842177.jpg?v=1688993351&width=3000",
        ),
      );
    });
  }

  void _removeChat(int index) {
    setState(() {
      chatList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.separated(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return Dismissible(
            key: Key(chat.name),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _removeChat(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${chat.name} deleted')),
              );
            },
            child: ChatCard(chat: chat),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewChat,
        child: const Icon(Icons.add),
      ),
    );
  }
}
