import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:login_page/model/profile.dart';

import 'package:login_page/features/profile/resources/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository _repository = ProfileRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchedProfileEvent>(_repository.getProfileData);
  }
}
