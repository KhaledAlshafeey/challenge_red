import 'package:challenge/views/post_view/widgets/post_body_w_username.dart';
import 'package:challenge/views/post_view/widgets/post_utils.dart';
import 'package:challenge/views/post_view/widgets/video_conts_wid.dart';
import 'package:challenge/views/post_view/widgets/video_wid.dart';
import 'package:challenge/views/post_view/widgets/post_header.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            VideoPlayerWid(),
            VideoControllers(),
            PostUtils(),
            PostBodyWuserName(userName: 'KhaledAlshafeey', body: 'body'),
            PostHeader(title: 'Motorcycles'),
          ],
        ),
      ),
    );
  }
}
