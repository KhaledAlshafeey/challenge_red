// ignore_for_file: deprecated_member_use_from_same_package
part of reddit_sheets;

class _CommentsScrollableArea extends ConsumerWidget {
  const _CommentsScrollableArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(repliesProvider);
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels == 0.0 &&
            notification.metrics.atEdge) {}
        return false;
      },
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MainPostItem(),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 130.h),
            sliver: SliverList.builder(
              itemCount: cont.replies.length,
              itemBuilder: (_, ind) {
                return _ReplyItem(
                  index: ind,
                  body: cont.replies[ind],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MainPostItem extends StatelessWidget {
  const _MainPostItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserNameWid(
          radius: 10.r,
          spacing: 12.w,
          userName: 'KhaledAlshafeey',
          isReply: true,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'body',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _ReplyItem extends ConsumerStatefulWidget {
  const _ReplyItem({
    required this.index,
    required this.body,
  });
  final int index;
  final String body;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __ReplyItemState();
}

class __ReplyItemState extends ConsumerState<_ReplyItem> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isHidden = !_isHidden;
        setState(() {});
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _isHidden ? 50.h : null,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: AppColors.sheetMain,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UserNameWid(
                userName: 'KhaledAlshafeey',
                isReply: true,
                radius: 10.r,
              ),
              if (!_isHidden)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.body,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    _ReplyUtils(
                      counter: 0,
                      index: widget.index,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _ReplyUtils extends StatelessWidget {
  const _ReplyUtils({required this.counter, required this.index});
  final int index;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            await BottomSheets.showMoreReply(context: context, index: index);
          },
          child: const Icon(
            Icons.more_horiz_rounded,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Row(
          children: [
            Assets.icons.reply.svg(
              height: 20.h,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Reply',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        const _ReplyVote(
          counter: 0,
        )
      ],
    );
  }
}

class _ReplyVote extends StatefulWidget {
  const _ReplyVote({
    this.counter,
  });
  final int? counter;

  @override
  State<_ReplyVote> createState() => __ReplyVoteState();
}

class __ReplyVoteState extends State<_ReplyVote> {
  int _counter = 0;
  bool _isUpvote = false;
  bool _isDownVote = false;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter ?? 0;
    setState(() {});
  }

  _onVote(VoteOption vote) {
    if (vote == VoteOption.upVote) {
      if (_isUpvote) {
        _isUpvote = false;
        _counter--;
        setState(() {});
        return;
      }
      if (_isDownVote) {
        _isDownVote = false;
        _counter++;
      }
      _counter++;

      _isUpvote = true;
      setState(() {});
      return;
    }
    if (_isDownVote) {
      _isDownVote = false;
      _counter++;
      setState(() {});
      return;
    }
    if (_isUpvote) {
      _isUpvote = false;
      _counter--;
    }
    _counter--;
    _isDownVote = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8.w,
        ),
        VoteWid(
          vote: VoteOption.upVote,
          onVote: () {
            _onVote(VoteOption.upVote);
          },
          isDownVote: _isDownVote,
          isUpvote: _isUpvote,
        ),
        SizedBox(
          width: 8.h,
        ),
        Text(
          _counter.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          width: 8.h,
        ),
        VoteWid(
          vote: VoteOption.downVote,
          onVote: () {
            _onVote(VoteOption.downVote);
          },
          isDownVote: _isDownVote,
          isUpvote: _isUpvote,
        ),
      ],
    );
  }
}
