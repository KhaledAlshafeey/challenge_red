part of reddit_dialogs;

class _DeleteDialogWid extends ConsumerWidget {
  const _DeleteDialogWid({
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.sheetMain,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure?',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'You cannot restore comments that have been deleted',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedCornerButton(
                  height: 40.h,
                  title: 'CANCEL',
                  onTap: () => Navigator.pop(context),
                  isCancel: true,
                ),
                SizedBox(
                  width: 8.w,
                ),
                RoundedCornerButton(
                  height: 40.h,
                  title: 'DELETE',
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(repliesProvider).delete(index);
                  },
                  isCancel: false,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
