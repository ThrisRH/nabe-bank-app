// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/core/theme/typography.dart';
import 'package:nabe_bank_application/core/widgets/layout/sub_screen/index.dart';
import 'package:nabe_bank_application/router/app_router.dart';
// import 'package:nabe_bank_application/screens/ocr_scanner/index.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Yêu cầu quyền (Android 13+ hoặc iOS)
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await messaging.requestPermission();
    final fCMToken = await messaging.getToken();

    print("token: $fCMToken");
  }

  initNotifications();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ScrollAppBarController controller = Get.put(ScrollAppBarController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter", extensions: [appTypographyLight]),
      initialRoute: Routes.home,
      getPages: AppRoutes.pages,
    );
  }
}
