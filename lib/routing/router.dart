import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/explore/explore.dart' as explore;
import '../ui/home/home.dart' as home;
import '../ui/workspace/workspace.dart' as workspace;
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerConfig = GoRouter(
  observers: [
    GoRouteObserver(),
  ],
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home.path,
  routes: [
    GoRoute(
      path: Routes.home.path,
      builder: (context, state) {
        return home.HomeScreen(
          viewModel: home.HomeViewModel(),
        );
      },
      routes: [
        GoRoute(
          path: Routes.workspace.path,
          builder: (context, state) {
            return const workspace.HomeScreen();
          },
          routes: [
            GoRoute(
              path: Routes.workspaceDetails.path,
              builder: (context, state) {
                return const workspace.DetailsScreen();
              },
              routes: [
                GoRoute(
                  path: Routes.workspaceTimer.path,
                  builder: (context, state) {
                    return const workspace.TimerScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: Routes.explore.path,
          builder: (context, state) {
            return const explore.HomeScreen();
          },
          routes: [
            GoRoute(
              path: Routes.exploreDetails.path,
              builder: (context, state) {
                return const explore.DetailsScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class GoRouteObserver extends RouteObserver {
  @override
  void didPush(route, previousRoute) {
    if (kDebugMode) {
      print(route);
    }
    super.didPush(route, previousRoute);
  }
}
