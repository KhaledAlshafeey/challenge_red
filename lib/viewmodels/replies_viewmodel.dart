import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repliesProvider = ChangeNotifierProvider<RepliesViewModel>((ref) {
  return RepliesViewModel();
});

class RepliesViewModel extends ChangeNotifier {
  final List<String> _replies = List.generate(
      10,
      (index) =>
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''');

  List<String> get replies => _replies;

  void addReply(String body) {
    _replies.insert(0, body);
    notifyListeners();
  }

  void delete(int index) {
    _replies.removeAt(index);
    notifyListeners();
  }
}
