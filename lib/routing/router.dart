import 'package:crochetime/routing/routes.dart';
import 'package:go_router/go_router.dart';

import '../ui/explore/explore.dart' as explore;
import '../ui/home/home_screen.dart';
import '../ui/home/home_viewmodel.dart';
import '../ui/login/login_screen.dart';
import '../ui/login/login_viewmodel.dart';
import '../ui/workspace/workspace.dart' as workspace;

final routerConfig = GoRouter(
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
            path: Routes.workspace,
            builder: (context, state) {
              return const workspace.HomeScreen();
            },
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  return const workspace.DetailsScreen();
                },
              ),
            ]),
        GoRoute(
            path: Routes.explore,
            builder: (context, state) {
              return const explore.HomeScreen();
            },
            routes: [
              GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    return const explore.DetailsScreen();
                  })
            ]),
      ],
    ),
  ],
);
