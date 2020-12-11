import 'package:equatable/equatable.dart';

@Deprecated('Request')
abstract class OutEntity extends Equatable {
  Map<String, dynamic> toJson();
}