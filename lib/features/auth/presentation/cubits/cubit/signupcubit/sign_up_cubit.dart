import 'package:bloc/bloc.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/user_data.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String userType,
    String? businessName,
    String? serviceId,
    bool? hasAHomeServices,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
        userType: userType,
        businessName: businessName,
        hasAHomeServices: hasAHomeServices,
        serviceId: serviceId);

    result.fold(
      (failure) {
        emit(SignUpFailure(errMessage: failure.errMessage));
      },
      (user) {
        emit(SignUpSuccess(user.userData!));
      },
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SignUpLoading());
    final result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) {
        emit(SignUpFailure(errMessage: failure.errMessage));
      },
      (user) {
        emit(SignUpSuccess(user));
      },
    );
  }

  Future<void> signinWithFacebook() async {
    emit(SignUpLoading());
    final result = await authRepo.signinWithFacebook();
    result.fold(
      (failure) {
        emit(SignUpFailure(errMessage: failure.errMessage));
      },
      (user) {
        emit(SignUpSuccess(user));
      },
    );
  }
}
