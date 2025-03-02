import 'package:costly/features/user_profile/data/models/profile/user_profile.dart';
import 'package:costly/features/user_profile/domain/repo/user_profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileRepo profileRepo;
  UserProfileCubit(this.profileRepo) : super(UserProfileInitial());

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (failure) {
        emit(UserProfileFailure(message: failure.errMessage));
      },
      (profile) {
        emit(UserProfileSuccess(profile: profile.payload));
        
      },
    );
  }
}
