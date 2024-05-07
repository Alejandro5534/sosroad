import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/core/data/local/shared_preferences_service.dart';
import 'package:sosroad/features/auth/aplication/presentation/auth_screen.dart';
import 'package:sosroad/features/home/presentation/home_screen.dart';
import 'package:sosroad/features/verification/aplication/presentation/verification_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(
                CurveTween(curve: Curves.easeInOut),
              ),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ),
      GoRoute(
        redirect: (context, state) async {
          final String? phoneNumber =
              await ref.read(sharedPreferencesProvider).getPhoneNumber();
          return phoneNumber != null ? '/' : '/login';
        },
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const AuthScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(
                CurveTween(curve: Curves.easeInOut),
              ),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ),
      GoRoute(
        path: '/verification/:phone',
        pageBuilder: (context, state) {
          final phone = state.pathParameters['phone'];
          // const phone = '+524431301895';
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: VerficationScreen(
              phone: phone!,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation.drive(
                  CurveTween(curve: Curves.easeInOut),
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
    ],
  );
}
