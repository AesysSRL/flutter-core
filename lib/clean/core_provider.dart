import 'package:flutter/foundation.dart';

@deprecated
abstract class CoreProvider<S> with ChangeNotifier {
  @protected
  S _state;

  S get state => _state;

  void setState(S newState) {
    _state = newState;
    notifyListeners();
  }

  CoreProvider({@required S initialState}) : _state = initialState;
}
