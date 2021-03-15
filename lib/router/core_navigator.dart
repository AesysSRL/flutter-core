import 'package:clean_architecture_core/clean_architecture_core.dart';
import 'package:flutter/widgets.dart';

CoreNavigator get navigator => getIt<CoreNavigator>(instanceName: 'root');

BuildContext? get applicationContext => getIt<CoreNavigator>(instanceName: 'root').navigatorKey.currentContext;

class CoreNavigator {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static CoreNavigator instance({required String ref}) => getIt<CoreNavigator>(instanceName: ref);

  static void registerNavigator({required String ref}) => getIt.registerLazySingleton<CoreNavigator>(
        () => CoreNavigator(),
        instanceName: ref,
      );

  Future<T?> pushNamed<T extends Object>(String routeName, {Object? arguments}) async {
    final result = await _navigatorKey.currentState?.pushNamed<T>(routeName, arguments: arguments);
    if (result != null && result is T) {
      return result;
    }
    return null;
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object>(String routeName, RoutePredicate predicate,
      {Object? arguments}) async {
    final result =
        await _navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(routeName, predicate, arguments: arguments);
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

  Future<bool?> maybePop<T extends Object?>([T? result]) async {
    final res = await _navigatorKey.currentState?.maybePop(result);
    if (res != null && res is bool) {
      return res;
    }
    return null;
  }
}
