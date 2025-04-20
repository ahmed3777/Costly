part of 'cities_cubit.dart';

sealed class CitiesState {}

final class CitiesInitial extends CitiesState {}

final class CitiesLoading extends CitiesState {}

final class CitiesSuccess extends CitiesState {
  final List<City> cities;
  CitiesSuccess({required this.cities});
}

final class CitiesFailure extends CitiesState {
  final String message;

  CitiesFailure({required this.message});
}
