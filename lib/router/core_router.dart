import 'package:flutter/material.dart';

abstract class CoreRouter {
  final String initialRoute;

  CoreRouter(this.initialRoute);

  Route<dynamic>? Function(RouteSettings settings);
}