part of 'countries_cubit.dart';

sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}

final class CountriesLoading extends CountriesState {}

final class CountriesSuccess extends CountriesState {
  final List<Country> countries;
  CountriesSuccess({required this.countries});
}

final class CountriesFailure extends CountriesState {
  final String errMessage;
  CountriesFailure({required this.errMessage});
}
