import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nabe_bank_application/build_context_extensions.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

abstract class BaseInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool isDisabled;

  const BaseInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.keyboardType,
    required this.readOnly,
    required this.isDisabled,
    this.inputFormatters,
  });

  Widget buildInputField(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (label.isNotEmpty)
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
        buildInputField(context),
      ],
    );
  }
}
