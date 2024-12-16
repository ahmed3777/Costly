import 'package:bloc/bloc.dart';
import 'package:costly/features/auth/data/models/login_response/login_response.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signinWithPhoneAndPassword(
      {required String phone, required String password}) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithPhoneAndPassword(
        phone: phone, password: password);
    result.fold(
      (failure) {
        emit(SigninFailure(message: failure.errMessage));
      },
      (user) {
        emit(SigninSuccess(loginResponse: user));
      },
    );
  }
}
