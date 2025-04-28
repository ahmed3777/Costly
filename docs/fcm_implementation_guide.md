# Firebase Cloud Messaging (FCM) Implementation Guide

## 1. Add Dependencies
Add to `pubspec.yaml`:
```yaml
dependencies:
  firebase_messaging: ^14.7.10
```

## 2. Android Setup
Add to `android/app/src/main/AndroidManifest.xml` inside `<application>`:
```xml
<meta-data
    android:name="com.google.firebase.messaging.default_notification_channel_id"
    android:value="high_importance_channel" />
```

## 3. iOS Setup
Add to `ios/Runner/Info.plist`:
```xml
<key>FirebaseAppDelegateProxyEnabled</key>
<false/>
```

## 4. Implementation Steps

### A. Create Notification Service
Create `lib/core/services/notification_service.dart`:
```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Request permission for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM token
    String? token = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $token');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');
      }
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    // Handle notification taps
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Message opened from background: ${message.data}');
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.messageId}');
}
```

### B. Add to Dependency Injection
In `lib/core/services/get_it_services.dart`:
```dart
import 'package:costly/core/services/notification_service.dart';

void setupGetIt() {
  // Add this line in the services section
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(),
  );
}
```

### C. Initialize in Main
In `lib/main.dart`:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ... other initialization code ...
  
  setupGetIt();
  
  // Initialize notification service
  await getIt<NotificationService>().initialize();
  
  runApp(const MyApp());
}
```

## 5. Testing
1. Run `flutter pub get`
2. Get FCM token from logs
3. Use Firebase Console or Postman to send test notifications

## 6. Common Issues
- Android: Ensure Google Services JSON is properly configured
- iOS: Check provisioning profiles and capabilities
- Background messages: Verify proper channel setup
- Token issues: Check Firebase project configuration

## 7. Additional Resources
- [Firebase Cloud Messaging Documentation](https://firebase.google.com/docs/cloud-messaging)
- [Flutter FCM Plugin Documentation](https://pub.dev/packages/firebase_messaging)

## 8. NotificationService Class Detailed Explanation

### Class Overview
The `NotificationService` class is a singleton service that handles all Firebase Cloud Messaging (FCM) operations in your app.

### Properties
```dart
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
```
- Creates a single instance of FirebaseMessaging
- Used throughout the class to interact with FCM

### Methods

#### 1. initialize()
```dart
Future<void> initialize() async {
    // Request permission for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,    // Allow notification alerts
      badge: true,    // Allow app icon badges
      sound: true,    // Allow notification sounds
    );
```
- Requests notification permissions from the user (required for iOS)
- Sets up three types of permissions: alerts, badges, and sounds
- Returns a `NotificationSettings` object with the user's choices

```dart
    // Get FCM token
    String? token = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $token');
```
- Retrieves the unique FCM token for this device
- This token is needed to send notifications to this specific device
- Should be sent to your backend server for future notifications

```dart
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');
      }
    });
```
- Sets up a listener for messages received while the app is in the foreground
- `message.data` contains custom data sent with the notification
- `message.notification` contains the notification content (title, body, etc.)

```dart
    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
```
- Sets up a handler for messages received when the app is in the background
- Uses a separate function marked with `@pragma('vm:entry-point')`
- This function must be top-level (not inside a class)

```dart
    // Handle notification taps
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Message opened from background: ${message.data}');
    });
```
- Sets up a listener for when users tap on notifications
- Triggered when the app is opened from a notification
- Useful for navigation or specific actions based on notification content

#### 2. subscribeToTopic()
```dart
Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
}
```
- Subscribes the device to a specific topic
- Topics allow sending notifications to multiple devices at once
- Example: "news", "updates", "promotions"

#### 3. unsubscribeFromTopic()
```dart
Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
}
```
- Removes the device from a specific topic
- Stops receiving notifications for that topic

### Background Message Handler
```dart
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    debugPrint('Handling a background message: ${message.messageId}');
}
```
- Handles messages received when the app is in the background
- Must be a top-level function
- `@pragma('vm:entry-point')` ensures the function is accessible to the native code
- Can perform background tasks like updating local storage or scheduling tasks

### Usage Examples

1. **Sending a Notification**
```dart
// From your backend or Firebase Console
{
  "to": "DEVICE_FCM_TOKEN",
  "notification": {
    "title": "New Message",
    "body": "You have a new message"
  },
  "data": {
    "type": "message",
    "id": "123"
  }
}
```

2. **Subscribing to Topics**
```dart
final notificationService = getIt<NotificationService>();
await notificationService.subscribeToTopic('news');
```

3. **Handling Notification Taps**
```dart
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  if (message.data['type'] == 'message') {
    // Navigate to message screen
    Navigator.pushNamed(context, '/messages/${message.data['id']}');
  }
});
```

### Best Practices
1. Always request permissions before using notifications
2. Store the FCM token on your backend
3. Handle different notification types appropriately
4. Use topics for group notifications
5. Implement proper error handling
6. Test both foreground and background scenarios 