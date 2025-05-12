import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/features/user_profile/data/models/profile/profile.dart';
import 'package:costly/features/user_profile/domain/repo/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:costly/core/extensions/api_service_extensions.dart';

import 'package:dio/dio.dart';

class UserProfileRepoImp implements UserProfileRepo {
  final ApiService apiService;

  UserProfileRepoImp({required this.apiService});

  @override
  Future<Either<Failure, Profile>> getUserProfile() async {
    try {
      final token = await SharedPref.getSecuredString(SharedPrefKeys.userToken);
      final response = await apiService.get(ApiEndPoints.profile, token: token);
      final Profile profile = Profile.fromJson(response.data);

      await SharedPref.setData(SharedPrefKeys.userEmail, profile.payload.email);
      await SharedPref.setData(
          SharedPrefKeys.userImageUrl, profile.payload.logoUrl);
      
      // Check if FCM token is null in the response
      if (profile.payload.firebaseCloudMessagingToken == null) {
        // Get the stored FCM token
          await apiService.sendFcmTokenToBackend();
        }

      
      return right(profile);
    } catch (e) {
      if (e is DioException) {
        return left(handleError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
