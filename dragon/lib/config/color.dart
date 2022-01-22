import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF1EA6FC);
const HijauColor = Color(0xFF1CAF82);
const UnguColor = Color(0xFF623CEA);
const OrangeColor = Color(0xFFFF9E0B);
const GreyColor = Color(0xFFBFBFBF);
const ShadowColor = Color(0xFFF4F4F4);
const AbuColor = Color(0xFFAEB6BA);
const kBackgroundColor = Color(0xFFF3F9FE);

const PrimaryGradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [kPrimaryColor, HijauColor],
);

extension ColorExtension on Color {
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * value).round(), (green * value).round(),
        (blue * value).round());
  }
}