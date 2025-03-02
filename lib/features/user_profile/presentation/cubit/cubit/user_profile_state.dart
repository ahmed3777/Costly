part of 'user_profile_cubit.dart';

sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileSuccess extends UserProfileState {
  final UserProfile profile;
  UserProfileSuccess({required this.profile});
}

final class UserProfileFailure extends UserProfileState {
  final String message;
  UserProfileFailure({required this.message});
}
