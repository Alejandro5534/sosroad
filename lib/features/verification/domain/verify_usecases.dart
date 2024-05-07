import 'package:sosroad/features/verification/data/verify_code_repository.dart';

class VerifiedCode {
  final VerifyCodeRepository verifyCodeRepository;

  VerifiedCode({required this.verifyCodeRepository});

  Future<bool> execute() async {
    final verifiedStatus = await verifyCodeRepository.verifyCode();
    return verifiedStatus.code == 200;
  }
}
