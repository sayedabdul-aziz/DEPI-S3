// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class FCMHandler {
//   static final _firebaseMessaging = FirebaseMessaging.instance;

//   static final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   static init() async {
//     // Request permission for iOS
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     // get Token for this device
//     String? token;
//     if (Platform.isAndroid) {
//       token = await _firebaseMessaging.getToken();
//     } else {
//       token = await _firebaseMessaging.getAPNSToken();
//     }

//     if (token != null) {
//       // call api to send token to server
//     }

//     // ------  Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //! we have problem here with displaying notification
//       // to display notification use flutter_local_notifications package
//       // TODO: Handle redirection to specific screen based on message data

//       _showNotification(message);
//       if (message.data.isNotEmpty) {
//         handleRoutingFromNotification(message.data);
//       }
//     });

//     // ------ Handle background messages
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // ------- Handle messages when the app is opened from a terminated state
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       if (message.data.isNotEmpty) {
//         handleRoutingFromNotification(message.data);
//       }
//     });

//     // ------- Check for initial message when the app is opened from a terminated state
//     FirebaseMessaging.instance.getInitialMessage().then((
//       RemoteMessage? message,
//     ) {
//       if (message != null && message.data.isNotEmpty) {
//         handleRoutingFromNotification(message.data);
//       }
//       // TODO: Handle redirection to specific screen based on message data
//     });

//     // Initialize flutter local notifications

//     const initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );

//     await _localNotifications.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (payload) {},
//     );
//   }

//   static Future<void> _showNotification(RemoteMessage message) async {
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'default_channel_id',
//         'default_channel_name',
//         channelDescription: 'your channel description',
//         importance: Importance.high,
//         priority: Priority.high,
//         ticker: 'ticker',
//       ),
//       iOS: DarwinNotificationDetails(),
//     );
//     await _localNotifications.show(
//       message.hashCode,
//       message.notification?.title ?? '',
//       message.notification?.body ?? '',
//       notificationDetails,
//     );
//   }
// }

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// }

// handleRoutingFromNotification(Map<String, dynamic> data) {
//   var type = data['type'];
//   if (type == 'search') {
//     pushToBase(globalContext!, Routes.patientMain);
//     pushTo(globalContext!, Routes.homeSearch, extra: 'ا');
//   }
// }