// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/core/theme/typography.dart';
import 'package:nabe_bank_application/core/widgets/layout/sub_screen/index.dart';
import 'package:nabe_bank_application/router/app_router.dart';
// import 'package:nabe_bank_application/screens/ocr_scanner/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
