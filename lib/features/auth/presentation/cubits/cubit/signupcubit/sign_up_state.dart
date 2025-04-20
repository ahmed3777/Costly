part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

final class SignUpSuccess extends SignUpState {
  final UserData userData;

  SignUpSuccess(this.userData);
}

// final class SignUpLSocialLoading extends SignUpState {}

// final class SignUpLSocialFailure extends SignUpState {
//   final String message;
//   SignUpLSocialFailure({required this.message});
// }

// final class SignUpLSocialSuccess extends SignUpState {

//   SignUpLSocialSuccess();
// }
