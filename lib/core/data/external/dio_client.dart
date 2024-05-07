import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/external/api_constants.dart';
import 'package:sosroad/core/data/local/shared_preferences_service.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
  );

  Dio dio = Dio(options);
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      options.headers['Authorization'] = await sharedPrefs.getToken();
      // final uri = Uri.parse('${options.baseUrl}${options.path}')
      //     .replace(queryParameters: options.queryParameters);
      // print("URL: $uri, Headers: ${options.headers}");
      handler.next(options);
    },
  ));
  // dio.interceptors.add(AuthInterceptor(ref));
  return dio;
}
