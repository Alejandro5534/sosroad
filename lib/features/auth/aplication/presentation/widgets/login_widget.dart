import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sosroad/core/data/local/shared_preferences_service.dart';
import 'package:sosroad/core/routes/router.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/data/external/token_provider.dart';
import '../../../domain/form_validators.dart';

class LoginWidget extends ConsumerWidget with Validators {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cellphone = TextEditingController();
    final router = ref.watch(routerProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: cellphone,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Cellphone',
                          hintText: 'Enter your cellphone',
                        ),
                        inputFormatters: [CellphoneInputFormatter()],
                        maxLength: 10,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => validateCellphone(cellphone.text),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            final isCellphoneValid =
                                validateCellphone(cellphone.text);
                            if (isCellphoneValid == null) {
                              final token = await ref
                                  .read(sharedPreferencesProvider)
                                  .getToken();
                              if (token == null) {
                                final auth = ref.read(tokenProvider);
                                await auth.getApiToken();
                              }
                              //Pending intl
                              router.go(
                                  '/verification/+52${cellphone.text.trim()}');
                            } else {
                              toastification.show(
                                context: context,
                                title: const Text('Incorrect data'),
                                autoCloseDuration: const Duration(seconds: 3),
                                type: ToastificationType.error,
                                showProgressBar: false,
                              );
                            }
                          },
                          child: const Text('Sign in'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text('Only by Mexico extension (+52)')
          ],
        ),
      ),
    );
  }
}
