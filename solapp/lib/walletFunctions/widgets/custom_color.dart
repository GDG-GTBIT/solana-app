import 'package:flutter/material.dart';

const success = Color(0xFF00E556);

CustomColors lightCustomColors = const CustomColors(
  sourceColor: Color(0xFF00E556),
  color: Color(0xFF006E25),
  onSuccess: Color(0xFFFFFFFF),
  successContainer: Color(0xFF6CFF80),
  onSuccessContainer: Color(0xFF002106),
);

CustomColors darkCustomColors = const CustomColors(
  sourceColor: Color(0xFF00E556),
  color: Color(0xFF00E556),
  onSuccess: Color(0xFF00390F),
  successContainer: Color(0xFF00531A),
  onSuccessContainer: Color(0xFF6CFF80),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceColor,
    required this.color,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
  });

  final Color? sourceColor;
  final Color? color;
  final Color? onSuccess;
  final Color? successContainer;
  final Color? onSuccessContainer;

  @override
  CustomColors copyWith({
    Color? sourceCustomcolor1,
    Color? customcolor1,
    Color? onCustomcolor1,
    Color? customcolor1Container,
    Color? onCustomcolor1Container,
  }) {
    return CustomColors(
      sourceColor: sourceCustomcolor1 ?? this.sourceColor,
      color: customcolor1 ?? this.color,
      onSuccess: onCustomcolor1 ?? this.onSuccess,
      successContainer: customcolor1Container ?? this.successContainer,
      onSuccessContainer: onCustomcolor1Container ?? this.onSuccessContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceColor: Color.lerp(sourceColor, other.sourceColor, t),
      color: Color.lerp(color, other.color, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
      successContainer: Color.lerp(successContainer, other.successContainer, t),
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
