import 'package:challenge/resources/app_colors.dart';
import 'package:challenge/resources/generated/assets.gen.dart';
import 'package:challenge/utils/enums/vote_operation.dart';
import 'package:challenge/widgets/responsive_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoteWid extends ConsumerStatefulWidget {
  const VoteWid({
    super.key,
    required this.vote,
    required this.onVote,
    required this.isDownVote,
    required this.isUpvote,
  });
  final VoteOption vote;
  final Function() onVote;
  final bool isUpvote;
  final bool isDownVote;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VoteWidState();
}

class _VoteWidState extends ConsumerState<VoteWid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = widget.vote == VoteOption.upVote
        ? const Offset(0, -10)
        : const Offset(0, 5);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: _offset,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutExpo,
      ),
    );

    _controller.addListener(() {
      debugPrint(_animation.value.toString());
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  void _handleTap() {
    if (!_controller.isAnimating) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.vote == VoteOption.upVote
        ? Transform.translate(
            offset: _animation.value,
            child: ResponsiveIconGestureDet(
              onTap: () {
                if (!widget.isUpvote) {
                  _handleTap();
                }
                widget.onVote();
              },
              hoverColor: widget.isUpvote
                  ? AppColors.upVote.withOpacity(0.6)
                  : Colors.white54,
              mainColor: widget.isUpvote ? AppColors.upVote : Colors.white,
              isIcon: false,
              height: 20.h,
              customIcon: !widget.isUpvote
                  ? Assets.icons.upvoteUnfilled
                  : Assets.icons.upvoteFilled,
            ),
          )
        : Transform.translate(
            offset: _animation.value,
            child: ResponsiveIconGestureDet(
              onTap: () {
                if (!widget.isDownVote) {
                  _handleTap();
                }
                widget.onVote();
              },
              hoverColor: widget.isDownVote
                  ? AppColors.downVote.withOpacity(0.6)
                  : Colors.white54,
              mainColor: widget.isDownVote ? AppColors.downVote : Colors.white,
              isIcon: false,
              height: 20.h,
              customIcon: widget.isDownVote
                  ? Assets.icons.downvoteFilled
                  : Assets.icons.downvoteUnfilled,
            ),
          );
  }
}
