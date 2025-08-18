import 'package:clean_architecture_flutter/core/routing/route_names.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.loginPath,
    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.loginPath,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.signUpPath,
            builder: (BuildContext context, GoRouterState state) {
              return const SingUpPage();
            },
          ),
        ],
      ),
    ],
  );
}
