import 'package:equatable/equatable.dart';

abstract class OutEntity extends Equatable {
  Map<String, dynamic> toJson();
}