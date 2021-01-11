import 'package:flutter/foundation.dart';

abstract class CoreProvider<S> with ChangeNotifier{
  S _state;
  S get state => _state;

  void setState(S newState) {
    _state = newState;
    notifyListeners();
  }
}