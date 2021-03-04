import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ViewModel<S> {
  @protected
  final Rx<S> _state;

  Rx<S> get state => _state;

  ViewModel(S initialState) : _state = Rx<S>(initialState);
}