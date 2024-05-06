import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sosroad/core/routes/router.dart';

import '../../../domain/form_validators.dart';

class LoginWidget extends ConsumerWidget with Validators {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = TextEditingController();
    final cellphone = TextEditingController();
    final router = ref.watch(routerProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    inputFormatters: [NameInputFormatter()],
                    validator: (value) {
                      return validateName(name.text) ? null : 'Invalid name';
                    },
                  ),
                  TextFormField(
                    controller: cellphone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Cellphone',
                      hintText: 'Enter your cellphone',
                    ),
                    inputFormatters: [CellphoneInputFormatter()],
                    maxLength: 10,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => validateCellphone(cellphone.text)
                        ? null
                        : 'Cellphone must be at least 6 characters long',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        router.go('/verification');
                      },
                      child: const Text('Sign in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
