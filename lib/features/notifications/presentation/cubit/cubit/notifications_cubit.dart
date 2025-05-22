import 'package:costly/features/notifications/data/models/notifications/notification_payload.dart';
import 'package:costly/features/notifications/domain/repos/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepo notificationRepo;
  NotificationsCubit(this.notificationRepo) : super(NotificationsInitial());

  Future<void> getNotifications() async {
    emit(NotificationsLoading());
    final result = await notificationRepo.getNotifications();
    result.fold((failure) {
      emit(NotificationsFailure(message: failure.errMessage));
    }, (r) => emit(NotificationsSuccess(notifications: r.payload)));
  }
}
