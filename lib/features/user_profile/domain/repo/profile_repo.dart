import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/user_profile/data/models/profile/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {

  Future<Either<Failure, Profile>> getUserProfile();
  
}