import 'package:challenge/resources/generated/assets.gen.dart';
import 'package:challenge/utils/enums/vote_operation.dart';
import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/viewmodels/post_vote_conter.dart';
import 'package:challenge/widgets/vote_animation.dart';
import 'package:challenge/widgets/responsive_gesture_detector.dart';
import 'package:challenge/widgets/sheets/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostUtils extends ConsumerWidget {
  const PostUtils({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(postUtilNotifier);
    final sheetCont = ref.watch(commentSheetNotifier);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: sheetCont ? 0 : 1,
      child: Align(
        alignment: const Alignment(.93, .85),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VoteWid(
              isUpvote: cont.isUpvote,
              isDownVote: cont.isDownVote,
              onVote: () => cont.vote(VoteOption.upVote),
              vote: VoteOption.upVote,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                cont.counter.toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            VoteWid(
              isUpvote: cont.isUpvote,
              isDownVote: cont.isDownVote,
              onVote: () => cont.vote(VoteOption.downVote),
              vote: VoteOption.downVote,
            ),
            SizedBox(
              height: 25.h,
            ),
            ResponsiveIconGestureDet(
              onTap: () async {
                ref.read(commentSheetNotifier.notifier).update(
                      (state) => state = true,
                    );
                await BottomSheets.showCommentsSheet(context: context);
                ref.read(commentSheetNotifier.notifier).update(
                      (state) => state = false,
                    );
              },
              hoverColor: Colors.white54,
              mainColor: Colors.white,
              isIcon: false,
              customIcon: Assets.icons.comments,
            ),
            SizedBox(
              height: 25.h,
            ),
            ResponsiveIconGestureDet(
              onTap: () {},
              hoverColor: Colors.white54,
              mainColor: Colors.white,
              isIcon: false,
              customIcon: Assets.icons.share,
            ),
          ],
        ),
      ),
    );
  }
}
