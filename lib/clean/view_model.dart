import 'package:get/get.dart';

abstract class ViewModel<S> {
  final Rx<S> _state;

  Rx<S> get state => _state;

  ViewModel(S initialState) : _state = Rx<S>(initialState);
}