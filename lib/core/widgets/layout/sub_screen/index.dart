import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class ScrollAppBarController extends GetxController {
  final scrollOffset = 0.0.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      scrollOffset.value = (scrollController.offset / 100).clamp(0, 1);
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class SubScreenLayout extends StatelessWidget {
  final Widget child;
  final String title;
  SubScreenLayout({super.key, required this.child, required this.title});

  final ScrollAppBarController scrollController =
      Get.find<ScrollAppBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
                colors: <Color>[
                  Color(0xFFFFFFFF).withValues(alpha: 0.82),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
            child: child,
          ),

          // TitleBar
          Obx(() {
            return Container(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
              color: Colors.white.withValues(
                alpha: scrollController.scrollOffset.value,
              ),
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: context.typography.h4.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
