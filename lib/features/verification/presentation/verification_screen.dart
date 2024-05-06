import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sosroad/core/routes/router.dart';

class VerficationScreen extends ConsumerWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return Scaffold(
      body: Center(
        child: PinCodeTextField(
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          appContext: context,
          length: 6,
          onCompleted: (value) async {
            router.go('/');
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(20),
              inactiveColor: const Color(0xfffc7272),
              activeColor: const Color(0xff4ba4f2),
              selectedColor: Colors.black87),
          onChanged: (String value) {},
        ),
      ),
    );
  }
}
