import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/viewmodels/video_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWid extends ConsumerStatefulWidget {
  const VideoPlayerWid({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerWidState();
}

class _VideoPlayerWidState extends ConsumerState<VideoPlayerWid> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(videoNotifier.notifier).init(_controller);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cont = ref.watch(videoNotifier);
    final sheetCont = ref.watch(commentSheetNotifier);
    return cont.isInit
        ? AnimatedPositioned(
            bottom: sheetCont ? 0.6.sh : 0,
            top: 0,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 250),
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
