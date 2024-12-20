import 'package:family_locator/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:family_locator/features/profile/presentation/bloc/profile_event.dart';
import 'package:family_locator/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<ProfileBloc>(context);
        final profile = state.profile;

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: state.imageHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        profile.imgURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile.fullName,
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  Divider(),
                  const Text("Information", style: TextStyle(fontSize: 24)),
                  Divider(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text("username: ", style: TextStyle(fontSize: 18)),
                      Text("@${profile.username}", style: const TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Description:", style: TextStyle(fontWeight: FontWeight.w900)),
                  Divider(),
                  Text(profile.description, style: const TextStyle(fontSize: 16)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => bloc.add(ShrinkImage()),
                        icon: const Icon(Icons.phone),
                        label: const Text("Shrink image"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => bloc.add(ResetImageSize()),
                        icon: const Icon(Icons.message),
                        label: const Text("Reset image"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
