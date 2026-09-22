import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsServices {
  // This class will handle push notifications services
  // Add methods and properties as needed for your application

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // Handle background messages
    //print("Handling a background message: ${message.messageId}");
    _messageStream.add(message.notification?.title ?? "SIN TITULO");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // Handle incoming messages
    //print("Handling a message: ${message.messageId}");
    _messageStream.add(message.notification?.title ?? "SIN TITULO");
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // Handle when the app is opened from a notification
    //print("Handling a message when the app is opened: ${message.messageId}");
    _messageStream.add(message.notification?.title ?? "SIN TITULO");
  }

  static Future initializeApp() async {
    // Initialize push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  void subscribeToTopic(String topic) {
    // Subscribe to a topic for push notifications
  }

  void unsubscribeFromTopic(String topic) {
    // Unsubscribe from a topic for push notifications
  }

  void sendNotification(String title, String message) {
    // Send a push notification with the given title and message
  }

  static closeStreams() {
    // Close the stream controller when it's no longer needed
    _messageStream.close();
  }
}
