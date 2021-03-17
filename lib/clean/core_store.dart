import 'package:flutter/foundation.dart';

abstract class CoreStore {
  final List<VoidCallback> _reactiveDisposers = [];

  void addReaction(VoidCallback reactionDisposer) {
    _reactiveDisposers.add(reactionDisposer);
  }

  void resetReactions() {
    _reactiveDisposers.forEach((d) => d());
    _reactiveDisposers.clear();
  }
}
