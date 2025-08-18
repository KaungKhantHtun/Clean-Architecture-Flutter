import 'package:clean_architecture_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_flutter/features/user/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteService {
  static String initialPath = "/login";
  static String homePagePath = "/profile";

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfilePage();
            },
          ),
        ],
      ),
    ],
  );
}
