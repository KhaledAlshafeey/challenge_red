library reddit_sheets;

import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/resources/generated/assets.gen.dart';
import 'package:challenge/utils/enums/vote_operation.dart';
import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/viewmodels/replies_viewmodel.dart';
import 'package:challenge/widgets/dialogs/app_dialogs.dart';
import 'package:challenge/widgets/rounded_corner_button.dart';
import 'package:challenge/widgets/user_name.dart';
import 'package:challenge/widgets/vote_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

part 'post_more_sheet.dart';
part 'sheet_item.dart';
part 'comment_sheet/comments_sheet.dart';
part 'comment_sheet/widgets/commet_widgets.dart';
part 'comment_sheet/widgets/comments_sctollable_area.dart';

class BottomSheets {
  static Future showPostMoreSheet({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const _PostMoreSheet();
      },
    );
  }

  static Future showCommentsSheet({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const _CommentsSheet();
      },
    );
  }

  static Future showMoreReply({
    required BuildContext context,
    required int index,
  }) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _PostMoreSheet(
          index: index,
        );
      },
    );
  }
}
