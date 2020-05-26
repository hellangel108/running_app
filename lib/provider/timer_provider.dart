import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  String _timeDisplay = "00:00";

  String get timeDisplay => _timeDisplay;
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    _timeDisplay = swatch.elapsed.inMinutes.toString().padLeft(2, "0") +
        ":" +
        (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");

    notifyListeners();
  }

  void startStopwatch() {
    swatch.start();
    startTimer();
  }

  void pauseStopwatch() {
    swatch.stop();
  }

  void resetStopwatch() {
    swatch.reset();
    _timeDisplay = "00:00";
  }
}
