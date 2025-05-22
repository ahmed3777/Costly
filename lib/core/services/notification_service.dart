import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/core/extensions/api_service_extensions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final ApiService _apiService;

  NotificationService(this._apiService);

  Future<void> initialize() async {
    try {
      // Request permission for iOS
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      // Get and handle FCM token
      await _handleFCMToken();

      // Listen for token refresh
      _firebaseMessaging.onTokenRefresh.listen((String newToken) {
        _handleFCMToken();
      });

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.data}');

        if (message.notification != null) {
          debugPrint(
              'Message also contained a notification: ${message.notification}');
        }
      });

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

      // Handle notification taps when app is in background or terminated
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('Message opened from background: ${message.data}');
        // Handle navigation or other actions when notification is tapped
      });
    } catch (e) {
      debugPrint('Error initializing notification service: $e');
    }
  }

  Future<void> _handleFCMToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (token != null && token.isNotEmpty) {
        debugPrint('FCM Token: $token');
        SharedPref.setSecuredString(SharedPrefKeys.fcmToken, token);
        await _apiService.sendFcmTokenToBackend();
      }
    } catch (e) {
      debugPrint('Error handling FCM token: $e');
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      debugPrint('Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('Error subscribing to topic: $e');
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      debugPrint('Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('Error unsubscribing from topic: $e');
    }
  }
}

// Background message handler
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.messageId}');
}
