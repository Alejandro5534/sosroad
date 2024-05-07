import 'package:dio/dio.dart';
import 'package:sosroad/core/data/external/api_constants.dart';

class SendPhoneApi {
  final Dio dio;
  final String phone;

  SendPhoneApi({required this.dio, required this.phone});

  Future<Response> sendPhone() async {
    final responseSend = await dio.post(
      ApiConstants.sendPhone,
      queryParameters: {
        'token': '',
        'type': 'A',
        'phone': phone,
      },
    );
    return responseSend;
  }
}
