import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/features/auth/data/send_phone_repository.dart';
import 'package:sosroad/features/auth/domain/auth_usecase.dart';

part 'auth_provider.g.dart';

@riverpod
Future<bool> login(LoginRef ref, String phone) async {
  final repository = ref.watch(sendPhoneProvider(phone));
  final isMessageSend = await PostMessage(repository: repository).execute();
  return isMessageSend;
}
