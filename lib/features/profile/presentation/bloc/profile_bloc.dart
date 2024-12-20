import 'package:family_locator/features/profile/data/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static const double defaultImageHeight = 330;
  static const double smallImageHeight = 150;

  ProfileBloc(ProfileModel initialProfile)
      : super(ProfileState(profile: initialProfile, imageHeight: defaultImageHeight)) {
    on<LoadProfile>((event, emit) {
      emit(state.copyWith(profile: state.profile));
    });

    on<ShrinkImage>((event, emit) {
      emit(state.copyWith(imageHeight: smallImageHeight));
    });

    on<ResetImageSize>((event, emit) {
      emit(state.copyWith(imageHeight: defaultImageHeight));
    });
  }
}
