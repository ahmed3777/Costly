
import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/notifications/data/models/notifications/notifications.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {

  Future<Either<Failure, Notifications>> getNotifications(
    
  );
}
