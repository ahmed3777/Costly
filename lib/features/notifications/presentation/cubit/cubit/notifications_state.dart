part of 'notifications_cubit.dart';

sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final List<NotificationPayload> notifications;
  NotificationsSuccess({required this.notifications});
}

final class NotificationsFailure extends NotificationsState {
  final String message;
  NotificationsFailure({required this.message});
}
