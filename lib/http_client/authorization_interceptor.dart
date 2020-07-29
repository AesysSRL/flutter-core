
import 'package:dio/dio.dart';

const authClient = 'authClient';

class AuthorizationInterceptor extends Interceptor {

  @override
  Future onRequest(RequestOptions options) async {
//    final result = await getIt.get<UsersRepository>().userToken();
//    result.fold((error) => log.i(error.message), (token) {
//      try {
//        options.headers.update(
//            'Authorization',
//                (_) => 'Bearer $token'
//        );
//      } catch (e) {
//        options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
//      }
//    });
    return super.onRequest(options);
  }
}
