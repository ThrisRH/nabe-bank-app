import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class PasswordInput extends StatelessWidget {
  final String label;
  final String hint;
  const PasswordInput({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            label,
            style: context.typography.body4.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.labelGrey,
            ),
          ),
        ),

        Container(
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: context.typography.body3.copyWith(
                      color: AppColors.inputPlaceHolder,
                    ),
                  ),
                ),
              ),

              SvgPicture.asset("lib/assets/svg/eye-open.svg"),
            ],
          ),
        ),
      ],
    );
  }
}
