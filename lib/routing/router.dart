import 'package:crochetime/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home_screen.dart';
import '../ui/home/home_viewmodel.dart';
import '../ui/login/login_screen.dart';
import '../ui/login/login_viewmodel.dart';

GoRouter routerConfig() => GoRouter(
      initialLocation: Routes.home,
      routes: [
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginScreen(
              viewModel: LoginViewModel(),
            );
          },
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return HomeScreen(
              viewModel: HomeViewModel(),
            );
          },
          routes: [
            GoRoute(
              path: Routes.details,
              builder: (context, state) {
                return const Placeholder();
              },
            ),
          ],
        ),
      ],
    );
