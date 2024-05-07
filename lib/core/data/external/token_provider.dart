import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/external/api_constants.dart';
import 'package:sosroad/core/data/external/dio_client.dart';
import 'package:sosroad/core/data/local/shared_preferences_service.dart';
import 'package:sosroad/core/domain/token_model.dart';

part 'token_provider.g.dart';

@riverpod
TokenService token(TokenRef ref) {
  return TokenService(ref);
}

class TokenService {
  TokenService(this.ref);
  final Ref ref;

  Future<String?> getPreferenceToken() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider);
    final token = sharedPrefs.getToken();
    return token;
  }

  Future<String?> getApiToken() async {
    final Dio dio = ref.read(dioClientProvider);
    print('Before request');
    final responseToken = await dio.post(
      ApiConstants.token,
      queryParameters: {'keycode': ApiConstants.tokenKeyCode},
    );
    print('Before token');
    final deserialize = TokenModel.fromMap(responseToken.data);
    if (deserialize.code == 200) {
      print('Success token');
      final token = deserialize.data.authorized;
      final sharedPrefs = ref.read(sharedPreferencesProvider);
      sharedPrefs.setToken(token);
      return token;
    }
    print('Failure token');
    return null;
  }
}
