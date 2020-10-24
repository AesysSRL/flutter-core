
import 'package:flutter/widgets.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T> pushNamed<T extends Object>(String routeName, {Object arguments,}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
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

  void pop<T extends Object>(BuildContext context, [ T result ]) {
    navigatorKey.currentState.pop<T>(result);
  }

  void popUntil(BuildContext context, RoutePredicate predicate) {
    navigatorKey.currentState.popUntil(predicate);
  }
}