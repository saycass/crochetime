import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/core/ui/bottom_nav_bar.dart';
import '../ui/explore/explore.dart' as explore;
import '../ui/home/home.dart' as home;
import '../ui/workspace/workspace.dart' as workspace;
import 'routes.dart';

final routerConfig = GoRouter(
  observers: [AppRouteObserver()],
  initialLocation: Routes.root.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavBar(navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          observers: [AppRouteObserver()],
          routes: [
            GoRoute(
              path: Routes.explore.path,
              builder: (context, state) {
                return const explore.HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          observers: [AppRouteObserver()],
          routes: [
            GoRoute(
              path: Routes.root.path,
              builder: (context, state) {
                return home.HomeScreen(
                  viewModel: home.HomeViewModel(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          observers: [AppRouteObserver()],
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
          ],
        ),
      ],
    ),
  ],
);

class AppRouteObserver extends RouteObserver {
  final List<String> _stack = [];

  @override
  void didPush(route, previousRoute) {
    super.didPush(route, previousRoute);
    if (kDebugMode) {
      _stack.add(route.settings.name.toString());
      print('History: $_stack');
    }
  }

  @override
  void didPop(route, previousRoute) {
    super.didPop(route, previousRoute);
    if (kDebugMode) {
      _stack.removeLast();
      print('History: $_stack');
    }
  }
}
