part of reddit_sheets;

class _CommentsSheet extends ConsumerWidget {
  const _CommentsSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsEditor = ref.watch(commentEditorNotifier);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
      height: commentsEditor ? .95.sh : 0.6.sh,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Stack(
        children: [
          Column(
            children: [
              _Divider(),
              Expanded(child: _CommentsScrollableArea()),
            ],
          ),
          _CommentWid(),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.sheetMain,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 40.w,
          child: const Divider(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
