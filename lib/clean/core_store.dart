import 'package:flutter/foundation.dart';

abstract class CoreStore {
  final List<VoidCallback> _reactiveDisposers = [];

  void addReaction(VoidCallback reactionDisposer) {
    _reactiveDisposers.add(reactionDisposer);
  }

  void resetReactions() {
    for (final d in _reactiveDisposers) {
      d();
    }
    _reactiveDisposers.clear();
  }
}
