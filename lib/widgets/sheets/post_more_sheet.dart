part of reddit_sheets;

class _PostMoreSheet extends StatelessWidget {
  const _PostMoreSheet({
    this.index,
  });
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.sheetMain,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Wrap(
        children: [
          _SheetItem(
            title: 'Share',
            isFirst: true,
            onTap: () {},
            isIcon: false,
            customIcon: Assets.icons.share,
          ),
          _SheetItem(
            title: 'Save',
            onTap: () {},
            isIcon: false,
            customIcon: Assets.icons.save,
          ),
          _SheetItem(
            title: 'Copy text',
            onTap: () {},
            isIcon: false,
            customIcon: Assets.icons.copyTxt,
          ),
          _SheetItem(
            title: 'Block Account',
            onTap: () {},
            isIcon: false,
            customIcon: Assets.icons.block,
          ),
          _SheetItem(
            title: 'Hide',
            onTap: () {},
            isIcon: false,
            customIcon: Assets.icons.hide,
          ),
          _SheetItem(
            title: 'Delete',
            onTap: () async {
              if (index == null) {
                return;
              }
              Navigator.pop(context);
              await AppDialogs.showDeleteDialog(
                context: context,
                index: index!,
              );
            },
            isIcon: true,
            icon: Icons.delete,
            iconColor: Colors.white,
          ),
          RoundedCornerButton(
            onTap: () => Navigator.pop(context),
            title: 'Cancel',
            isCancel: true,
            height: 40.h,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
