import 'package:flutter/widgets.dart';

class CoreNavigator {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<T?> pushNamed<T extends Object>(String routeName, {Object? arguments}) async {
    final result = await _navigatorKey.currentState?.pushNamed<T>(routeName, arguments: arguments);
    if (result != null && result is T) {
      return result;
    }
    return null;
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object>(String routeName, RoutePredicate predicate) async {
    final result = await _navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(routeName, predicate);
    if (result != null && result is T) {
      return result;
    }
    return null;
  }

  Future<T?> pushReplacementNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    final res = await _navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
    if (res != null && res is T) {
      return res;
    }
    return null;
  }

  Future<T?> popAndPushNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    final res = await _navigatorKey.currentState?.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
    if (res != null && res is T) {
      return res;
    }
    return null;
  }

  void pop<T extends Object>([T? result]) {
    _navigatorKey.currentState?.pop<T>(result);
  }

  void popUntil(RoutePredicate predicate) {
    _navigatorKey.currentState?.popUntil(predicate);
  }
}
