import 'package:flutter/material.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class InfoField extends StatelessWidget {
  final String nameOfField;
  final String contentOfField;
  final InfoStatus status;
  const InfoField({
    super.key,
    required this.nameOfField,
    required this.contentOfField,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color getContentColor() {
      switch (status) {
        case InfoStatus.important:
          return AppColors.primary;
        case InfoStatus.error:
          return AppColors.error;
        case InfoStatus.success:
          return AppColors.success;
        case InfoStatus.disabled:
          return AppColors.labelGrey;
        default:
          return AppColors.darkBlue;
      }
    }

    FontWeight getFontWeight() {
      switch (status) {
        case InfoStatus.important:
          return FontWeight.w600;
        case InfoStatus.error:
        case InfoStatus.success:
        case InfoStatus.disabled:
          return FontWeight.w400;
        default:
          return FontWeight.normal;
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              nameOfField,
              style: context.typography.body4.copyWith(
                color: AppColors.darkBlue,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              contentOfField,
              textAlign: TextAlign.end,
              style: context.typography.body3.copyWith(
                color: getContentColor(),
                fontWeight: getFontWeight(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum InfoStatus { normal, important, error, success, disabled }
