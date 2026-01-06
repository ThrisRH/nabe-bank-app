import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class ItemBox extends StatelessWidget {
  final String label;
  final String svgPath;
  final VoidCallback onTap;
  final bool isBackground;
  const ItemBox({
    super.key,
    required this.label,
    required this.svgPath,
    required this.onTap,
    this.isBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          isBackground
              ? Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2D4769).withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    AppColors.darkBlue,
                    BlendMode.srcIn,
                  ),
                ),
              )
              : SvgPicture.asset(
                svgPath,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(
                  AppColors.darkBlue,
                  BlendMode.srcIn,
                ),
              ),

          Text(
            label,
            style: context.typography.body4.copyWith(color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}
