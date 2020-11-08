import 'package:equatable/equatable.dart';

@Deprecated('unnecessary cast usually not add information on entity')
abstract class Model extends Equatable {

}

/// *
/// Use this for describe values necessary for a single widget
/// create this with factory.fromEntity
abstract class ViewModel extends Equatable {
}