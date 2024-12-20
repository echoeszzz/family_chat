import 'package:family_locator/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/chat/presentation/chat_screen.dart';
import 'features/chat_list/data/chat_card_model.dart';
import 'features/chat_list/presenation/chat_list_screen.dart';
import 'features/theme/theme_provider.dart';
import 'features/prac9/UserProvider.dart';
import 'features/profile/data/profile_model.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(
    UserProvider(
      currentUser: ProfileModel(
        id: 1,
        fullName: "Ivan Ruzin",
        username: "ivanruzin",
        description: "First profile page in my new messenger",
        birthDate: DateTime(2003, 7, 2),
        imgURL:
        "https://www.diamondartclub.com/cdn/shop/files/inspector-gadget"
            "-diamond-art-painting-34301116842177.jpg?v=1688993351&width=3000",
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
        ],
        child: const MyApp(),
      ),
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
          case '/profile':
            return MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(title: const Text('Ошибка')),
                body: const Center(child: Text('Страница не найдена')),
              ),
            );
        }
      },
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
