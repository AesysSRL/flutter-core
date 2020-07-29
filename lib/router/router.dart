import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Router {
  final String initialRoute;

  Router(this.initialRoute);

  RouteFactory generateAppRoute;
}
