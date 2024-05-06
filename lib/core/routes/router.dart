import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sosroad/features/auth/presentation/login_screen.dart';
import 'package:sosroad/features/home/presentation/home_screen.dart';
import 'package:sosroad/features/verification/presentation/verification_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(CurveTween(
                  curve: Curves
                      .easeInOut)), // Personalizar la curva de la animación
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(CurveTween(
                  curve: Curves
                      .easeInOut)), // Personalizar la curva de la animación
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ),
      GoRoute(
        path: '/verification',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const VerficationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(CurveTween(
                  curve: Curves
                      .easeInOut)), // Personalizar la curva de la animación
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ),
    ],
  );
}
