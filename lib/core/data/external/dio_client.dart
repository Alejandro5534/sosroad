import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  BaseOptions options = BaseOptions(
    baseUrl: "https://api4sun.dudewhereismy.mx/sosroad",
  );

  Dio dio = Dio(options);

  return dio;
}
