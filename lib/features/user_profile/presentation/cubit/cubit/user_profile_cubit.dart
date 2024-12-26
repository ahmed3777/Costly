import 'package:costly/features/user_profile/data/models/profile/user_profile.dart';
import 'package:costly/features/user_profile/domain/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final ProfileRepo profileRepo;
  UserProfileCubit(this.profileRepo) : super(UserProfileInitial());

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (failure) {
        emit(UserProfileFailure( message: failure.errMessage));
      },
      (profile) {
        emit(UserProfileSuccess( profile:profile.payload));
      },
    );
  }
}
