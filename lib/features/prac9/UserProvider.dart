import 'package:family_locator/features/profile/data/profile_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends InheritedWidget {
  final ProfileModel currentUser;

  const UserProvider({
    super.key,
    required this.currentUser,
    required super.child,
  });

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return oldWidget.currentUser != currentUser;
  }
}
