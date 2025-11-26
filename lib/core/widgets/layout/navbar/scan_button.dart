import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class ScanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  final double containerHeight = 52;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat();

    animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -containerHeight,
          end: containerHeight,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: containerHeight,
          end: -containerHeight,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
    ]).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

class ScanButton extends StatelessWidget {
  ScanButton({super.key});

  final ScanController scanController = Get.put(ScanController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF085ED8), Color(0xFF3C8DFF)],
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(
              "lib/assets/svg/qr-scan.svg",
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              fit: BoxFit.contain,
            ),
          ),

          AnimatedBuilder(
            animation: scanController.animation,
            builder: (context, child) {
              return Positioned(
                top: scanController.animation.value,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(color: AppColors.white),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
