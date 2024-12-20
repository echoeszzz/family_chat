import 'package:equatable/equatable.dart';
import 'package:family_locator/features/profile/data/profile_model.dart';

class ProfileState extends Equatable {
  final ProfileModel profile;
  final double imageHeight;

  const ProfileState({
    required this.profile,
    required this.imageHeight,
  });

  ProfileState copyWith({
    ProfileModel? profile,
    double? imageHeight,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      imageHeight: imageHeight ?? this.imageHeight,
    );
  }

  @override
  List<Object?> get props => [profile, imageHeight];
}
