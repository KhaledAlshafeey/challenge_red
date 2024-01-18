library reddit_dialogs;

import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/viewmodels/replies_viewmodel.dart';
import 'package:challenge/widgets/rounded_corner_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'delete_dialog.dart';

class AppDialogs {
  static Future showDeleteDialog({
    required BuildContext context,
    required int index,
  }) async {
    await showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return _DeleteDialogWid(
          index: index,
        );
      },
    );
  }
}
