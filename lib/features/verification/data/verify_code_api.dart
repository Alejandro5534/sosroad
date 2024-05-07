import 'package:dio/dio.dart';
import 'package:sosroad/core/data/external/api_constants.dart';

class VerifyCodeApi {
  final Dio dio;
  final String code;
  final String cellphone;

  VerifyCodeApi(
      {required this.dio, required this.code, required this.cellphone});

  Future<Response> sendCodeApi() async {
    final responseCode = dio.get(
      ApiConstants.sendPhone,
      queryParameters: {
        'code': code,
        'phone': cellphone,
      },
    );
    return responseCode;
  }
}
