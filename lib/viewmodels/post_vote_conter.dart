import 'package:challenge/utils/enums/vote_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postUtilNotifier = ChangeNotifierProvider<PostUitlViewModel>((ref) {
  return PostUitlViewModel();
});

class PostUitlViewModel extends ChangeNotifier {
  int _voteCounter = 0;
  bool _isUpvote = false;
  bool _isDownVote = false;

  int get counter => _voteCounter;
  bool get isUpvote => _isUpvote;
  bool get isDownVote => _isDownVote;

  void vote(VoteOption vote) {
    if (vote == VoteOption.upVote) {
      if (_isUpvote) {
        _isUpvote = false;
        _voteCounter--;
        notifyListeners();
        return;
      }
      if (_isDownVote) {
        _isDownVote = false;
        _voteCounter++;
      }
      _voteCounter++;

      _isUpvote = true;
      notifyListeners();
      return;
    }
    if (_isDownVote) {
      _isDownVote = false;
      _voteCounter++;
      notifyListeners();
      return;
    }
    if (_isUpvote) {
      _isUpvote = false;
      _voteCounter--;
    }
    _voteCounter--;
    _isDownVote = true;
    notifyListeners();
  }
}
