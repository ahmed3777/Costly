import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/firebase_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/features/auth/data/models/login_response/login_response.dart';
import 'package:costly/features/services/data/service_details/single_service.dart';
import 'package:costly/features/services/data/service_type/service_type/service_type.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/signup_response.dart';
import 'package:costly/features/auth/data/models/signup_models/signup_response/user_data.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImp implements AuthRepo {
  final ApiService apiService;
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.apiService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, SignupResponse>> signUp({
      required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String userType,
      String? businessName,
      bool? hasAHomeServices,
      String? serviceId}) async {
       try {
         final response = await apiService.post(ApiEndPoints.signup, {
         'email': email,
          'password': password,
          'name': name,
          'phone': phoneNumber,
          'type': userType,
        if (hasAHomeServices != null)
          'have_a_home_visit_service': hasAHomeServices,
        if (businessName != null) 'business_name': businessName,
        if (serviceId != null) 'service_type_id': serviceId
      });
      var userData = SignupResponse.fromJson(response);
      SharedPref.setData(SharedPrefKeys.userImageUrl,userData.userData!.userLogo,);
      SharedPref.setData(SharedPrefKeys.userName, userData.userData!.userName);
      SharedPref.setData(SharedPrefKeys.userEmail, userData.userData!.userEmail);
      SharedPref.setData(SharedPrefKeys.userPhoneNumber, phoneNumber);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> signInWithPhoneAndPassword(
      {required String phone, required String password}) async {
    try {
      final response = await apiService.post(ApiEndPoints.login, {
        'phone': phone,
        'password': password,
      });
      var userData = LoginResponse.fromJson(response);
      SharedPref.setData(SharedPrefKeys.userName, userData.user!.userName);
      SharedPref.setData(SharedPrefKeys.userImageUrl, userData.user!.userLogo);
      SharedPref.setData(SharedPrefKeys.userEmail, userData.user!.userEmail);
      SharedPref.setData(SharedPrefKeys.userPhoneNumber,phone);
      // return right(UserModel.fromJson(response));
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ServiceType>> getServices() async {
    try {
      final response = await apiService.get(ApiEndPoints.serviceType);
      if (response.data != null) {
        return right(ServiceType.fromJson(
            response.data)); // Add valid payloads to the list
      } else {
        return left(ServerFailure('No services found'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserData>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      print("firebaseAuthService: $user");
      String email = user.email ?? "";
      String phone = user.phoneNumber ?? "0123456789";
      String name = user.displayName ?? "";
      String type = "provider";
      SharedPref.setData(SharedPrefKeys.userName, name);
      SharedPref.setData(SharedPrefKeys.userPhoneNumber, phone);
      SharedPref.setData(SharedPrefKeys.userImageUrl, user.photoURL);
      SharedPref.setData(SharedPrefKeys.userEmail, email);
      String accountSocialProvider = "google";
      final request = await apiService.post(ApiEndPoints.socialLogin, {
        'email': email,
        'name': name,
        'type': type,
        'account_social_provider': accountSocialProvider
      });
      print(
          "API Response: $request"); // Add a print statement to debug the API response

      if (request != null && request['payload'] != null) {
        return right(UserData.fromJson(
            request['payload'])); // Ensure 'payload' is used correctly
      } else {
        return left(ServerFailure('No valid payload received'));
      }

      //   var userdata=UserData.fromFirebaseUser(user);
      // return right(userdata);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserData>> signinWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      print("firebaseAuthService: $user");
      String email = user.email ?? "";
      String phone = user.phoneNumber ?? "0123456789";
      String name = user.displayName ?? "";
      String accountSocialProvider = "facebook";
      SharedPref.setData(SharedPrefKeys.userName, name);
      SharedPref.setData(SharedPrefKeys.userPhoneNumber, phone);
      SharedPref.setData(SharedPrefKeys.userImageUrl, user.photoURL);
      SharedPref.setData(SharedPrefKeys.userEmail, user.email);
      final signupRequestToApi =
          await apiService.post(ApiEndPoints.socialLogin, {
          'email': email,
          'name': name,
         'type': 'customer',
         'account_social_provider': accountSocialProvider,
      });
      if (signupRequestToApi != null && signupRequestToApi != null) {
        print("Payload: $signupRequestToApi");
        var req = UserData.fromJson(signupRequestToApi);
        return right(req); // Ensure 'payload' is used correctly
      } else {
        return left(ServerFailure('No valid payload received'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  Future<bool> isUserLoggedIn() async {
    // Retrieve the token from secure storage
    try {
      String? token =
          await SharedPref.getSecuredString(SharedPrefKeys.userToken);

      // Check if the token is valid (not null or empty)
      if (token != null && token.isNotEmpty) {
        // Optionally, check token expiration here if using JWT
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error checking tokin status: $e");
      return false;
    }
  }

  // Optionally, you can add a method to logout the user
  Future<void> logout() async {
    await SharedPref.clearAllSecuredData();
    await SharedPref.clearAllData();
    await firebaseAuthService.signOut();
  }

  @override
  Future<Either<Failure, SingleService>> getSingleService(
      String serviceId) async {
    try {
      final result =await apiService.get("${ApiEndPoints.serviceType}/$serviceId");
      return right(SingleService.fromJson(result.data));
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
