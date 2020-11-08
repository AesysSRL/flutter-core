import 'package:equatable/equatable.dart';

@Deprecated('Use [RequestEntity]')
abstract class OutEntity extends Equatable {
  Map<String, dynamic> toJson();
}