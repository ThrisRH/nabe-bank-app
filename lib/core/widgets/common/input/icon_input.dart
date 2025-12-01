import 'package:flutter/material.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';
import 'package:nabe_bank_application/core/widgets/common/input/base_input.dart';

class IconInput extends BaseInput {
  final Widget icon; // Widget vì có thể truyền GestureDetector thay vì mỗi Icon

  const IconInput({
    super.key,
    required this.icon,
    required super.label,
    required super.hint,
    required super.controller,
    required super.onChanged,

    super.inputFormatters,
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
      ),

      child: Row(
        spacing: 12,
        children: [
          Expanded(
            child: TextField(
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              controller: controller,
              onChanged: onChanged,
              readOnly: readOnly,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: context.typography.body3.copyWith(
                  color: AppColors.inputPlaceHolder,
                ),
              ),
            ),
          ),

          icon,
        ],
      ),
    );
  }
}
