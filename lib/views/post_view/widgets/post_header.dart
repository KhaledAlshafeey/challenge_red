import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/widgets/profile_avatar.dart';
import 'package:challenge/widgets/responsive_gesture_detector.dart';
import 'package:challenge/widgets/sheets/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostHeader extends ConsumerWidget {
  const PostHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetCont = ref.watch(commentSheetNotifier);
    return AnimatedSlide(
      duration: const Duration(milliseconds: 250),
      offset: sheetCont ? const Offset(0, -5) : const Offset(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: sheetCont ? 0 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveIconGestureDet(
                onTap: () async {
                  // Navigator.pop(context);
                },
                isIcon: true,
                icon: Icons.arrow_back_rounded,
                hoverColor: AppColors.hoverColor,
                mainColor: Colors.white,
              ),
              Row(
                children: [
                  const ProfileAvatar(),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'r/$title',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              ResponsiveIconGestureDet(
                onTap: () async {
                  await BottomSheets.showPostMoreSheet(
                    context: context,
                  );
                },
                isIcon: true,
                icon: Icons.more_horiz,
                hoverColor: AppColors.hoverColor,
                mainColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
