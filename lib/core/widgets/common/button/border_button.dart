import 'package:flutter/material.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/button/base_button.dart';

class BorderButton extends BaseButton {
  const BorderButton({
    super.key,
    required super.onTap,
    required super.label,
    required super.isDisable,
  });

  @override
  Widget buildButtonField(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? () {} : onTap,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isDisable ? AppColors.inactive : Colors.transparent,
          border: Border.all(width: 1, color: AppColors.darkBlue),
        ),
        child: Center(
          child: Text(
            label,
            style: context.typography.body3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
