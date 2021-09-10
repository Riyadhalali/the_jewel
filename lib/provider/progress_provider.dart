import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  bool progressState = false;
//-> to know the state of the progress
  void progress(bool state) {
    progressState = state;
    notifyListeners();
  }
}
