import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/external/dio_client.dart';
import 'package:sosroad/features/verification/data/verify_code_api.dart';
import 'package:sosroad/features/verification/domain/get_message_model.dart';

part 'verify_code_repository.g.dart';

@riverpod
VerifyCodeRepository verifyCodeRepositor(VerifyCodeRepositorRef ref,
    {required String code, required String cellphone}) {
  final Dio dio = ref.read(dioClientProvider);
  final api = VerifyCodeApi(dio: dio, code: code, cellphone: cellphone);

  return VerifyCodeRepository(api: api);
}

class VerifyCodeRepository {
  final VerifyCodeApi api;

  VerifyCodeRepository({required this.api});

  Future<GetMessageModel> verifyCode() async {
    final responseCode = await api.sendCodeApi();
    final GetMessageModel getMessageModel =
        GetMessageModel.fromMap(responseCode.data);
    return getMessageModel;
  }
}
