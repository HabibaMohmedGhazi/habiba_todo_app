import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class TheAppStyle {
  static TextStyle theAppBarTextStyle = const TextStyle(
    fontSize: 22,
    color: AppColors.theWhite,
    fontWeight: FontWeight.w700,
  );
  static TextStyle theBigBlueText = const TextStyle(
    color: AppColors.thePrimary,
    fontSize: 27,
    fontWeight: FontWeight.w700,
  );
  static TextStyle theSettingText =
      const TextStyle(fontSize: 30, color: Colors.black);
}
