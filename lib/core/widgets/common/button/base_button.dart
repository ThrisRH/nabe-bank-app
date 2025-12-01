import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool isDisable;
  const BaseButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isDisable,
  });

  Widget buildButtonField(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildButtonField(context);
  }
}
