import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/layout/navbar/scan_button.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                _NavItem(
                  onTap: () {
                    Get.toNamed("/");
                  },
                  label: "Trang chủ",
                  svgPath: "lib/assets/svg/navigation/home.svg",
                  isActive: true,
                ),

                ScanButton(),
                _NavItem(
                  onTap: () {
                    Get.toNamed("/transaction");
                  },
                  label: "Lịch sử GD",
                  svgPath: "lib/assets/svg/navigation/transaction.svg",
                  isActive: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final bool isActive;
  final String label;
  final String svgPath;
  final VoidCallback onTap;
  const _NavItem({
    required this.label,
    required this.svgPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? AppColors.primary : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  isActive ? AppColors.primary : AppColors.darkBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),

            Text(
              label,
              style: context.typography.body4.copyWith(
                fontSize: 8,
                color: isActive ? AppColors.primary : AppColors.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
