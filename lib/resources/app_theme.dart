import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/resources/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.notoSans,
    scaffoldBackgroundColor: AppColors.bg,
    sliderTheme: SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorColor: Colors.black,
      overlayShape: SliderComponentShape.noOverlay,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      /// For main userName and post body
      /// under the video
      displayLarge: TextStyle(
        color: AppColors.postColor,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),

      /// replies usernames, and any static, generated txt
      displaySmall: TextStyle(
        color: AppColors.systemTxt,
        fontSize: 14.sp,
      ),
      displayMedium: TextStyle(
        color: AppColors.postColor,
        fontWeight: FontWeight.normal,
        fontSize: 15.sp,
      ),
    ),
  ).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
    ),
  );
}
