import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final videoNotifier = ChangeNotifierProvider<VideoViewModel>((ref) {
  return VideoViewModel();
});

final videoControllers = ChangeNotifierProvider<VideoControllers>((ref) {
  final videoProv = ref.watch(videoNotifier);
  return VideoControllers(videoProv.isInit ? videoProv.cont : null);
});

class VideoViewModel extends ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isInit = false;

  bool get isInit => _isInit;
  VideoPlayerController get cont => _controller;

  Future init(VideoPlayerController cont) async {
    _controller = cont;
    _isInit = true;
    await _controller.initialize();
    await _controller.setLooping(true);
    await _controller.play();
    notifyListeners();
  }
}

/// This notifier used for playing, pausing, seeking and muting the video
/// It's separate controller, therefore we eliminate unwanted builds
/// In the video widget.
class VideoControllers extends ChangeNotifier {
  final VideoPlayerController? _controller;
  String? _reamainingPos;
  Duration? _totDuration;
  double _sliderVal = 0;
  String? _totTime;
  String? _currentTime;

  VideoControllers(this._controller) {
    if (_controller != null) {
      _totDuration = _controller!.value.duration;
      _isPlaying = true;
      _totTime =
          '${_twoDigits(_totDuration!.inMinutes.remainder(60))}:${_twoDigits(_totDuration!.inSeconds.remainder(60))}';

      _controller!.addListener(() async {
        Duration? temp = await _controller!.position;

        _reamainingPos = _getRemainingTime(temp!);
        _sliderVal = _getSliderVal(temp);
        _currentTime =
            '${_twoDigits(temp.inMinutes.remainder(60))}:${_twoDigits(temp.inSeconds.remainder(60))}';

        notifyListeners();
      });
      notifyListeners();
    }
  }

  bool _isPlaying = false;
  bool _isMuted = false;

  bool get isPlaying => _isPlaying;
  bool get isMuted => _isMuted;
  String? get remainingTime => _reamainingPos;
  double get sliderVal => _sliderVal;
  String? get totTime => _totTime;
  String? get currentTime => _currentTime;

  Future pausePlay() async {
    if (_controller == null) {
      return;
    }
    if (_controller!.value.isPlaying) {
      await _controller!.pause();
      _isPlaying = false;
      notifyListeners();
      return;
    }
    await _controller!.play();
    _isPlaying = true;
    notifyListeners();
  }

  Future muteUnmute() async {
    if (_controller == null) {
      return;
    }
    if (_controller!.value.volume > 0) {
      await _controller!.setVolume(0);
      _isMuted = true;
      notifyListeners();
      return;
    }
    await _controller!.setVolume(1);
    _isMuted = false;
    notifyListeners();
  }

  Future seekTo(double val) async {
    if (_controller == null) {
      return;
    }
    _sliderVal = val;
    notifyListeners();
    await _controller!.seekTo(
      Duration(
        seconds: (_controller!.value.duration.inSeconds * val).toInt(),
      ),
    );
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    }
    return "0$n";
  }

  String _getRemainingTime(Duration current) {
    return '${_twoDigits(_totDuration!.inMinutes.remainder(60) - current.inMinutes.remainder(60))}:${_twoDigits(_totDuration!.inSeconds.remainder(60) - current.inSeconds.remainder(60))}';
  }

  double _getSliderVal(Duration current) {
    return current.inSeconds / _controller!.value.duration.inSeconds;
  }
}
