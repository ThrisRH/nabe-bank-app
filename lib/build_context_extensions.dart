import 'package:flutter/material.dart';
import 'package:nabe_bank_application/core/theme/typography.dart';

extension TypographyX on BuildContext {
  AppTypography get typography => Theme.of(this).extension<AppTypography>()!;
}
