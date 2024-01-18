import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/widgets/sheets/bottom_sheets.dart';
import 'package:challenge/widgets/user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostBodyWuserName extends ConsumerWidget {
  const PostBodyWuserName({
    super.key,
    required this.userName,
    required this.body,
  });
  final String userName;
  final String body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetCont = ref.watch(commentSheetNotifier);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: sheetCont ? 0 : 1,
      child: GestureDetector(
        onTap: () async {
          ref.read(commentSheetNotifier.notifier).update(
                (state) => state = true,
              );
          await BottomSheets.showCommentsSheet(context: context);
          ref.read(commentSheetNotifier.notifier).update(
                (state) => state = false,
              );
        },
        child: Align(
          alignment: const Alignment(0, .85),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserNameWid(
                  userName: userName,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  body,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
