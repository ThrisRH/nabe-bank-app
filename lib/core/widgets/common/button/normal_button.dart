import 'package:flutter/material.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/button/base_button.dart';

class NormalButton extends BaseButton {
  const NormalButton({
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
        width: double.infinity,
        height: 48,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isDisable ? AppColors.inactive : AppColors.primary,
        ),
        child: Center(
          child: Text(
            label,
            style: context.typography.body3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
