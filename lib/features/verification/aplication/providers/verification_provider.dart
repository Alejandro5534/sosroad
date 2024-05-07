import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/local/shared_preferences_service.dart';
import 'package:sosroad/features/verification/data/verify_code_repository.dart';
import 'package:sosroad/features/verification/domain/verify_usecases.dart';

part 'verification_provider.g.dart';

enum VerificationStatus { loading, error, success, begin }

@riverpod
class Verification extends _$Verification {
  @override
  VerificationStatus build() {
    return VerificationStatus.begin;
  }

  Future<bool> verification(
      {required String code, required String cellphone}) async {
    state = VerificationStatus.loading;
    final repository =
        ref.read(verifyCodeRepositorProvider(code: code, cellphone: cellphone));
    final verifiedStatus =
        await VerifiedCode(verifyCodeRepository: repository).execute();
    if (verifiedStatus) {
      state = VerificationStatus.success;
      ref.read(sharedPreferencesProvider).setPhoneNumber(cellphone);
    } else {
      state = VerificationStatus.error;
    }
    return verifiedStatus;
  }
}
