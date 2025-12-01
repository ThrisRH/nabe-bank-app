import 'package:flutter/material.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/input/base_input.dart';

class NormalInput extends BaseInput {
  const NormalInput({
    super.key,
    required super.label,
    required super.hint,
    required super.controller,
    required super.onChanged,

    super.keyboardType = TextInputType.text,
    super.readOnly = false,
    super.isDisabled = false,
  });

  @override
  Widget buildInputField(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 1, color: AppColors.border),
        color: isDisabled ? AppColors.inputDisable : Colors.transparent,
      ),

      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: context.typography.body3,
        readOnly: isDisabled,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: context.typography.body3.copyWith(
            color: AppColors.inputPlaceHolder,
          ),
        ),
      ),
    );
  }
}
