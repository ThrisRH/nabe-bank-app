import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nabe_bank_application/core/theme/typography.dart';
import 'package:nabe_bank_application/router/app_router.dart';
// import 'package:nabe_bank_application/screens/ocr_scanner/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
