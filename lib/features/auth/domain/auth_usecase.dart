import 'package:sosroad/features/auth/data/send_phone_repository.dart';

class PostMessage {
  final SendPhoneRepository repository;

  PostMessage({required this.repository});

  Future<bool> execute() async {
    final dataMessage = await repository.sendMessage();
    return dataMessage.code == 200;
  }
}
