import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/features/notifications/data/models/notifications/notifications.dart';
import 'package:costly/features/notifications/domain/repos/notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepoImp implements NotificationRepo {
  final ApiService apiService;

  NotificationRepoImp(this.apiService);
  @override
  Future<Either<Failure, Notifications>> getNotifications() async {
    try {
      final token = await SharedPref.getSecuredString(SharedPrefKeys.userToken);
      final response = await apiService.get(ApiEndPoints.notifications, token: token);
      final Notifications notifications = Notifications.fromJson(response.data);
      return right(notifications);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
  }

} 
}