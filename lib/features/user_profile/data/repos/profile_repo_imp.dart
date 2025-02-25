import 'package:costly/core/errors/failure.dart';
import 'package:costly/core/helper_functions/helpererror.dart';
import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/features/user_profile/data/models/profile/profile.dart';
import 'package:costly/features/user_profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImp implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImp({required this.apiService});

  @override
  Future<Either<Failure, Profile>> getUserProfile() async {
    try {
      final response = await apiService.get(ApiEndPoints.profile,
          token: SharedPref.getSecuredString(SharedPrefKeys.userToken));
      final Profile profile = Profile.fromJson(response.data);
      SharedPref.setData(SharedPrefKeys.userEmail, profile.payload.email);

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
