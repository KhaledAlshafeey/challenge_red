// ignore_for_file: deprecated_member_use_from_same_package

import 'package:challenge/resources/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class ResponsiveIconGestureDet extends StatefulWidget {
  const ResponsiveIconGestureDet({
    super.key,
    required this.onTap,
    required this.hoverColor,
    required this.mainColor,
    required this.isIcon,
    this.customIcon,
    this.icon,
    this.height,
  }) : assert((isIcon && icon != null) || (!isIcon && customIcon != null));

  final Function() onTap;
  final Color hoverColor;
  final Color mainColor;
  final bool isIcon;
  final SvgGenImage? customIcon;
  final IconData? icon;
  final double? height;
  @override
  State<ResponsiveIconGestureDet> createState() =>
      _ResponsiveIconGestureDetState();
}

class _ResponsiveIconGestureDetState extends State<ResponsiveIconGestureDet> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _isHover = true;
        setState(() {});
      },
      onLongPressEnd: (details) {
        _isHover = false;
        setState(() {});
      },
      onTap: widget.onTap,
      child: widget.isIcon
          ? Icon(
              widget.icon,
              color: _isHover ? widget.hoverColor : widget.mainColor,
              size: 26,
            )
          : widget.customIcon!.svg(
              color: _isHover ? widget.hoverColor : widget.mainColor,
              height: widget.height,
            ),
    );
  }
}
