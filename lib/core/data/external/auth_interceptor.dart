import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sosroad/core/data/external/dio_client.dart';
import 'package:sosroad/core/data/external/token_provider.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.ref);
  final Ref ref;
  int retryCount = 0;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenProvide = ref.read(tokenProvider);
    String? token = await tokenProvide.getPreferenceToken();
    token ??= await tokenProvide.getApiToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && retryCount < 3) {
      retryCount++;
      final tokenService = ref.read(tokenProvider);
      final newToken = await tokenService.getApiToken();
      final dio = ref.read(dioClientProvider);
      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        return handler.resolve(await dio.fetch(err.requestOptions));
      }
    }
    handler.next(err);
  }
}
