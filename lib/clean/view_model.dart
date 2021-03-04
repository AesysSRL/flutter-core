import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ViewModel<S> {
  @protected
  final Rx<S> $state;

  Rx<S> get state => $state;

  ViewModel(S initialState) : $state = Rx<S>(initialState);
}