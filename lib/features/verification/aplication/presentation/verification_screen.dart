import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sosroad/core/routes/router.dart';
import 'package:sosroad/features/auth/aplication/providers/auth_provider.dart';
import 'package:sosroad/features/verification/aplication/providers/verification_provider.dart';
import 'package:toastification/toastification.dart';

class VerficationScreen extends ConsumerWidget {
  final String phone;
  const VerficationScreen({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final isMessageSend = ref.watch(loginProvider(phone));
    final verifying = ref.watch(verificationProvider);
    return Scaffold(
      body: Center(
          child: isMessageSend.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'We send a message to your WhatsApp ($phone), enter the code:'),
                PinCodeTextField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  appContext: context,
                  length: 6,
                  onCompleted: (value) async {
                    final verify = await ref
                        .read(verificationProvider.notifier)
                        .verification(code: value, cellphone: phone);
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      if (verify) {
                        router.go('/');
                      } else {
                        toastification.show(
                          context: context,
                          title: const Text('Incorrect data'),
                          autoCloseDuration: const Duration(seconds: 3),
                          type: ToastificationType.error,
                          showProgressBar: false,
                        );
                      }
                    });
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(20),
                      inactiveColor: const Color(0xfffc7272),
                      activeColor: const Color(0xff4ba4f2),
                      selectedColor: Colors.black87),
                  onChanged: (String value) {},
                ),
                verifying == VerificationStatus.loading
                    ? const Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Checking code...'),
                        ],
                      )
                    : Container(),
                verifying == VerificationStatus.error
                    ? Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                ref.refresh(loginProvider(phone));
                              },
                              child: const Text('Resubmit')),
                          TextButton(
                              onPressed: () {
                                router.go('/login');
                              },
                              child: const Text('Change number'))
                        ],
                      )
                    : Container()
              ],
            ),
          );
        },
        error: (error, stackTrace) => Column(
          children: [
            const Text('Sorry have had been a problem'),
            TextButton(
              child: const Text('Try again'),
              onPressed: () {
                ref.refresh(loginProvider(phone));
              },
            ),
            TextButton(
              child: const Text('Return login'),
              onPressed: () {
                router.go('login');
              },
            ),
          ],
        ),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
