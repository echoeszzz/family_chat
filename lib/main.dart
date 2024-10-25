import 'package:family_locator/core/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/chat/presentation/chat_screen.dart';
import 'features/chat_list/data/chat_card_model.dart';
import 'features/chat_list/presenation/chat_list_screen.dart';
import 'features/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Chat App',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChatListScreen(),
            );
          case '/chat':
            final ChatModel chat = settings.arguments as ChatModel;
            return MaterialPageRoute(
              builder: (context) => ChatScreen(chat: chat),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: Text('Ошибка')),
                body: Center(child: Text('Страница не найдена')),
              ),
            );
        }
      },
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
