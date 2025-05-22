part of 'orders_cubit.dart';

sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersSuccess extends OrdersState {
  final MainOrders mainOrders;
  OrdersSuccess(this.mainOrders);
}
final class OrdersFailure extends OrdersState {
  final String message;
  OrdersFailure(this.message);
}