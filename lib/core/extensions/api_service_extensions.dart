import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';

extension FcmTokenExtension on ApiService {
  /// Sends the FCM token to the backend
  /// Returns true if successful, false otherwise
  Future<bool> sendFcmTokenToBackend() async {
    try {
      String? fcmToken = await SharedPref.getSecuredString(SharedPrefKeys.fcmToken);
      if (fcmToken != null && fcmToken.isNotEmpty) {
        await patch(ApiEndPoints.sendFcmToken, {
          'firebase_cloud_messaging_token': fcmToken
        });
        print('FCM token sent to backend successfully');
        return true;
      }
      return false;
    } catch (e) {
      print('Error sending FCM token: $e');
      return false;
    }
  }
} 