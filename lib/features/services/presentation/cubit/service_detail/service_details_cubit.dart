import 'package:bloc/bloc.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:costly/features/services/data/service_details/single_service.dart';
import 'package:meta/meta.dart';

part 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  ServiceDetailsCubit(this.authRepo) : super(ServiceDetailsInitial());

  final AuthRepo authRepo;

  Future<void> getSingleService(String serviceId) async {
    emit(ServiceDetailsLoading());
    final result = await authRepo.getSingleService(serviceId);
    result.fold(
      (failure) {
        emit(ServiceDetailsFailure(failure.errMessage));
      },
      (service) {
        emit(ServiceDetailsSuccess(service));
      },
    );
  }
}
