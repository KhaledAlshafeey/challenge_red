// ignore_for_file: deprecated_member_use_from_same_package

part of reddit_sheets;

class _SheetItem extends StatefulWidget {
  const _SheetItem({
    required this.title,
    this.isIcon = true,
    this.customIcon,
    this.iconColor,
    this.icon,
    required this.onTap,
    this.isFirst = false,
  }) : assert((isIcon && icon != null) || (!isIcon && customIcon != null));
  final String title;
  final Function() onTap;
  final bool isIcon;
  final IconData? icon;
  final SvgGenImage? customIcon;
  final bool isFirst;
  final Color? iconColor;

  @override
  State<_SheetItem> createState() => __SheetItemState();
}

class __SheetItemState extends State<_SheetItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _isHover = true;
        setState(() {});
      },
      onLongPressEnd: (details) {
        _isHover = false;
        setState(() {});
      },
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          border: _isHover
              ? Border(
                  top: !widget.isFirst
                      ? const BorderSide(
                          color: Colors.white54,
                          width: 0.5,
                        )
                      : BorderSide.none,
                  bottom: const BorderSide(
                    color: Colors.white54,
                    width: 0.5,
                  ),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.isIcon
                ? Icon(
                    widget.icon,
                    color: widget.iconColor,
                  )
                : SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: widget.customIcon!.svg(
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
