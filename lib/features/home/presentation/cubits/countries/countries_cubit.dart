import 'package:costly/features/home/data/models/country/countrys.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(this.homeRepo) : super(CountriesInitial());
  final HomeRepo homeRepo;

  Future<void> getCountries() async {
    emit(CountriesLoading());
    final result = await homeRepo.getCountries();
    result.fold((failure) {
      emit(CountriesFailure(errMessage: failure.errMessage));
    }, (countries) {
      emit(CountriesSuccess(countries: countries.payload));
    });
  }
}
