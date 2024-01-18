import 'package:challenge/utils/snak_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBars {
  static void showSnackBar({
    required String title,
    int? seconds,
  }) {
    ScaffoledHelper.scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds ?? 2),
        // backgroundColor: AppColors.primaryColor,
        content: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
