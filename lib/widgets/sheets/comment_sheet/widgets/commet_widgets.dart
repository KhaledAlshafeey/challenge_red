part of reddit_sheets;

class _CommentWid extends ConsumerStatefulWidget {
  const _CommentWid();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __CommentWidState();
}

class __CommentWidState extends ConsumerState<_CommentWid> {
  late TextEditingController _cont;

  @override
  void initState() {
    super.initState();
    _cont = TextEditingController();
  }

  @override
  void dispose() {
    _cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cont = ref.watch(commentEditorNotifier);
    return Align(
      alignment: const Alignment(0, 1),
      child: cont
          ? _CommentEditor(
              cont: _cont,
            )
          : _CommentPreview(cont: _cont),
    );
  }
}

class _CommentPreview extends ConsumerWidget {
  const _CommentPreview({
    required this.cont,
  });
  final TextEditingController cont;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(commentEditorNotifier.notifier)
            .update((state) => state = true);
      },
      child: Container(
        height: 80.h,
        color: AppColors.sheetMain,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.txtField,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  cont.text.isEmpty ? 'Add a comment' : cont.text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.image,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CommentEditor extends ConsumerStatefulWidget {
  const _CommentEditor({
    required this.cont,
  });
  final TextEditingController cont;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __CommentEditorState();
}

class __CommentEditorState extends ConsumerState<_CommentEditor> {
  double offsetY = 0.0;
  bool _isDraggingUp = false;
  bool _isDraggingDown = false;
  bool _isDown = true;
  double? _containerHeight;

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    offsetY += details.primaryDelta!;
    _isDraggingUp = details.primaryDelta! < 0;
    _isDraggingDown = details.primaryDelta! > 0;
    if (_isDown && _isDraggingDown) {
      ref.read(commentEditorNotifier.notifier).update((state) => state = false);
    } else {
      _isDown = false;
    }
    if (_isDraggingUp) {
      _containerHeight = 350.h;
      setState(() {});
    }

    if (_isDraggingDown) {
      _containerHeight = null;
      setState(() {});
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_isDraggingDown) {
      _isDraggingDown = false;
      _isDown = true;
    }
    if (_isDraggingUp) {
      _isDraggingUp = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
          VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(debugOwner: this),
            (VerticalDragGestureRecognizer instance) {
              instance
                ..onEnd = _onVerticalDragEnd
                ..onUpdate = _onVerticalDragUpdate;
            },
          ),
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 350.h,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _containerHeight,
            color: AppColors.sheetMain,
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 40.w,
                          child: const Divider(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Please follow ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'community rules',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(text: ' when commenting'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                _CommentTxtField(
                  cont: widget.cont,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CommentTxtField extends ConsumerStatefulWidget {
  const _CommentTxtField({
    required this.cont,
  });
  final TextEditingController cont;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __CommentTxtFieldState();
}

class __CommentTxtFieldState extends ConsumerState<_CommentTxtField> {
  bool _isFiledNotEmpty = false;

  @override
  void initState() {
    super.initState();
    widget.cont.addListener(() {
      if (widget.cont.text.trim().isNotEmpty && !_isFiledNotEmpty) {
        _isFiledNotEmpty = true;
        if (mounted) {
          setState(() {});
        }
      }
      if (widget.cont.text.trim().isEmpty && _isFiledNotEmpty) {
        _isFiledNotEmpty = false;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 240.h,
          ),
          child: TextField(
            controller: widget.cont,
            autofocus: true,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            cursorColor: Colors.blue,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              border: InputBorder.none,
              hintText: 'Add a comment',
              hintStyle: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.white24,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 5),
            child: RoundedCornerButton(
              height: 30.h,
              width: 60.w,
              color:
                  _isFiledNotEmpty ? Colors.blue : Colors.blue.withOpacity(.6),
              title: 'Reply',
              onTap: () {
                if (widget.cont.text.isEmpty) {
                  return;
                }
                ref
                    .read(repliesProvider.notifier)
                    .addReply(widget.cont.text.trim());
                widget.cont.clear();
                ref
                    .read(commentEditorNotifier.notifier)
                    .update((state) => state = false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
