import 'package:bloc/bloc.dart';
import 'package:costly/features/services/data/service_type/service_type/all_services.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this.authRepo) : super(ServicesInitial());
  final AuthRepo authRepo;

  Future<void> getServices() async {
    emit(ServicesLoading());
    final result = await authRepo.getServices();
    result.fold(
      (failure) {
        emit(ServicesFailure(failure.errMessage));
      },
      (services) {
        emit(ServicesSuccess(services.payload));
      },
    );
  }
}
