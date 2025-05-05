
import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/notifications/data/models/notifications/notifications.dart';
import 'package:costly/features/user_profile/data/models/profile/profile.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {

  Future<Either<Failure, Profile>> sendFcmToken();

  Future<Either<Failure, Notifications>> getNotifications(
    
  );
}

