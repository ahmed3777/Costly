import 'package:costly/features/home/data/models/city/city.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.homeRepo) : super(CitiesInitial());
  final HomeRepo homeRepo ;

  Future<void> getCities( String? countryId) async {
    emit(CitiesLoading());
    final result = await homeRepo.getCity(countryId);
    result.fold((failure) {
      emit(CitiesFailure(message: failure.errMessage));
    }, (cities) {
      emit(CitiesSuccess(cities: cities.payload));
    });
  }
}
///more important code is here

// class HomeRepoImp implements HomeRepo {
//   final ApiService apiService;
//   HomeRepoImp({required this.apiService});

//   // Generic API request handler
//   Future<Either<Failure, MainResponseModel<T>>> _fetchData<T>(
//       String endpoint, T Function(Map<String, dynamic>) fromJson) async {
//     try {
//       final response = await apiService.get(endpoint);
//       final data = MainResponseModel<T>.fromJson(response.data, fromJson);
//       return right(data);
//     } catch (e) {
//       return left(e is DioException ? handleError(e) : ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, MainResponseModel<Banners>>> getBanners() {
//     return _fetchData(ApiEndPoints.banners, (json) => Banners.fromJson(json));
//   }

//   @override
//   Future<Either<Failure, MainResponseModel<Country>>> getCountrys() {
//     return _fetchData(ApiEndPoints.countries, (json) => Country.fromJson(json));
//   }

//   @override
//   Future<Either<Failure, MainResponseModel<City>>> getCities(String countryId) {
//     return _fetchData("${ApiEndPoints.countries}/$countryId/cities", (json) => City.fromJson(json));
//   }
// }
