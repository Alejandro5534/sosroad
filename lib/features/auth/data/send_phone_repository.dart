import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/external/dio_client.dart';
import 'package:sosroad/features/auth/data/send_phone_api.dart';

import '../domain/send_message_model.dart';

part 'send_phone_repository.g.dart';

@riverpod
SendPhoneRepository sendPhone(SendPhoneRef ref, String phone) {
  final dio = ref.read(dioClientProvider);
  final api = SendPhoneApi(dio: dio, phone: phone);
  return SendPhoneRepository(api: api);
}

class SendPhoneRepository {
  final SendPhoneApi api;

  SendPhoneRepository({required this.api});
  Future<SendMessageModel> sendMessage() async {
    final Response dataResponse = await api.sendPhone();
    final SendMessageModel response =
        SendMessageModel.fromMap(dataResponse.data);
    return response;
  }
}
