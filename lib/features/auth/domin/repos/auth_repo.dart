import 'package:costly/core/errors/failure.dart';
import 'package:costly/features/auth/data/models/login_response/login_response.dart';
import 'package:costly/features/services/data/service_details/single_service.dart';
import 'package:costly/features/services/data/service_type/service_type/service_type.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/signup_response.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/user_data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupResponse>> signUp(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String userType,
      String? businessName,
      bool? hasAHomeServices,
      String? serviceId});

  Future<Either<Failure, LoginResponse>> signInWithPhoneAndPassword(
      {required String phone, required String password});

  Future<Either<Failure, ServiceType>> getServices();

  Future<Either<Failure, SingleService>> getSingleService(String serviceId);

  Future<Either<Failure, UserData>> signinWithGoogle();
  Future<Either<Failure, UserData>> signinWithFacebook();
}

