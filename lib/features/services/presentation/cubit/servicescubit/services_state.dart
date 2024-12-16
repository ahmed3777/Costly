part of 'services_cubit.dart';

@immutable
sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoading extends ServicesState {}

final class ServicesSuccess extends ServicesState {
  final List<AllServices> services;
  ServicesSuccess(this.services);
}

final class ServicesFailure extends ServicesState {
  final String message;
  ServicesFailure(this.message);
}
