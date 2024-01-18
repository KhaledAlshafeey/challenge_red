import 'package:challenge/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    super.key,
    this.isCancel = false,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.radius,
    this.color,
  });
  final bool isCancel;
  final String title;
  final double? width;
  final double? height;
  final Function() onTap;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 250),
        height: height ?? 50.h,
        width: width ?? 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 22),
          color:
              color ?? (isCancel ? AppColors.cancelButton : AppColors.okButton),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
