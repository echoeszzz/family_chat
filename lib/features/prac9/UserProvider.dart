import 'package:family_locator/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/data/profile_model.dart';

class UserProvider extends InheritedWidget {
  final ProfileModel currentUser;
  final ProfileBloc profileBloc;

  UserProvider({
    super.key,
    required this.currentUser,
    required Widget child,
  })  : profileBloc = ProfileBloc(currentUser),
        super(child: BlocProvider.value(value: ProfileBloc(currentUser), child: child));

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return oldWidget.currentUser != currentUser;
  }
}
