import 'package:flutter/material.dart';
import 'package:nabe_bank_application/core/theme/colors.dart';

class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle h1, h2, h3, h4;
  final TextStyle body1, body2, body3, body4;

  const AppTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
  });

  @override
  AppTypography copyWith({
    TextStyle? h1,
    h2,
    h3,
    h4,
    body1,
    body2,
    body3,
    body4,
  }) => AppTypography(
    h1: h1 ?? this.h1,
    h2: h2 ?? this.h2,
    h3: h3 ?? this.h3,
    h4: h4 ?? this.h4,
    body1: body1 ?? this.body1,
    body2: body2 ?? this.body2,
    body3: body3 ?? this.body3,
    body4: body4 ?? this.body4,
  );

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      body3: TextStyle.lerp(body3, other.body3, t)!,
      body4: TextStyle.lerp(body4, other.body4, t)!,
    );
  }
}

const AppTypography appTypographyLight = AppTypography(
  h1: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    height: 34 / 28,
  ),
  h2: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 30 / 24,
  ),
  h3: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 24 / 20,
  ),
  h4: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 24 / 18,
  ),
  body1: TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
  ),
  body2: TextStyle(fontSize: 16, color: AppColors.black, height: 24 / 16),
  body3: TextStyle(fontSize: 14, color: AppColors.black, height: 24 / 14),
  body4: TextStyle(fontSize: 12, color: AppColors.black, height: 24 / 12),
);
