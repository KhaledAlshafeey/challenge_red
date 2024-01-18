import 'package:challenge/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameWid extends StatelessWidget {
  const UserNameWid({
    super.key,
    required this.userName,
    this.isReply = false,
    this.radius,
    this.spacing,
  });
  final String userName;
  final bool isReply;
  final double? radius;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProfileAvatar(
          radius: radius,
        ),
        SizedBox(
          width: spacing ?? 5.w,
        ),
        Text(
          userName,
          style: !isReply
              ? Theme.of(context).textTheme.displayLarge
              : Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
