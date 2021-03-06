import 'package:flutter/material.dart';

import '../clean_architecture_core.dart';

abstract class CoreRouter {
  final String initialRoute;

  CoreRouter(this.initialRoute);

  static CoreRouter router() => getIt<CoreRouter>();

  RouteFactory? generateAppRoute;
}