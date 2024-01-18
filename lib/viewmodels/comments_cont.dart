import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentSheetNotifier = StateProvider<bool>((ref) {
  return false;
});

final commentEditorNotifier = StateProvider<bool>((ref) {
  return false;
});
