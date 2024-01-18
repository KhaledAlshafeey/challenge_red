import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/resources/generated/assets.gen.dart';
import 'package:challenge/viewmodels/comments_cont.dart';
import 'package:challenge/viewmodels/video_viewmodel.dart';
import 'package:challenge/widgets/responsive_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoControllers extends ConsumerWidget {
  const VideoControllers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoCont = ref.watch(videoControllers);
    final sheetCont = ref.watch(commentSheetNotifier);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: sheetCont ? 0 : 1,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveIconGestureDet(
                onTap: () async {
                  await videoCont.pausePlay();
                },
                hoverColor: AppColors.hoverColor,
                mainColor: Colors.white,
                isIcon: true,
                icon: videoCont.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              Expanded(
                child: SizedBox(
                  height: 15.h,
                  width: double.infinity,
                  child: Slider(
                    thumbColor: Colors.white,
                    overlayColor: const MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    label: '${videoCont.currentTime} / ${videoCont.totTime}',
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    value: videoCont.sliderVal,
                    onChanged: (val) {
                      videoCont.seekTo(val);
                    },
                    min: 0,
                    max: 1,
                  ),
                ),
              ),
              Text(
                videoCont.remainingTime ?? '00:00',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                width: 10.w,
              ),
              ResponsiveIconGestureDet(
                onTap: () async {
                  await videoCont.muteUnmute();
                },
                hoverColor: AppColors.hoverColor,
                mainColor: Colors.white,
                isIcon: false,
                customIcon: videoCont.isMuted
                    ? Assets.icons.volumeOff
                    : Assets.icons.volumeOn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
