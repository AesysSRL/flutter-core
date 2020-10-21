
import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<T> pushNamed<T extends Object>(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
  Future<T> pushNamedAndRemoveUntil<T extends Object>(String routeName, RoutePredicate predicate) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, predicate);
  }
  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(String routeName, {TO result, Object arguments,}) {
    return navigatorKey.currentState.pushReplacementNamed(routeName, result: result, arguments: arguments);
  }
  Future<T> popAndPushNamed<T extends Object, TO extends Object>(String routeName, {TO result, Object arguments,}) {
    return navigatorKey.currentState.popAndPushNamed(routeName, result: result, arguments: arguments);
  }
}