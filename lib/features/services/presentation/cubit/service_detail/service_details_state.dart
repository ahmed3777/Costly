part of 'service_details_cubit.dart';

@immutable
sealed class ServiceDetailsState {}

final class ServiceDetailsInitial extends ServiceDetailsState {}

final class ServiceDetailsLoading extends ServiceDetailsState {}

final class ServiceDetailsSuccess extends ServiceDetailsState {
  final SingleService service;
  ServiceDetailsSuccess(this.service);
}

final class ServiceDetailsFailure extends ServiceDetailsState {
  final String message;
  ServiceDetailsFailure(this.message);
}
