import 'package:costly/features/brands/domain/repos/brands_repo.dart';
import 'package:costly/features/brands/presentation/cubit/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandsRepo brandsRepo;

  BrandsCubit(this.brandsRepo) : super(BrandsInitial());

  Future<void> getBrands() async {
    emit(BrandsLoading());
    final result = await brandsRepo.getBrands();
    result.fold(
      (failure) {
        emit(BrandsFailure(failure.errMessage));
      },
      (brands) {
        emit(BrandsSuccess(brands));
      },
    );
  }
}
