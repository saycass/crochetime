import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/core/ui/bottom_nav_bar.dart';
import '../ui/explore/explore.dart' as explore;
import '../ui/home/home.dart' as home;
import '../ui/stopwatch/stopwatch.dart' as stopwatch;
import '../ui/wishlist/wishlist.dart' as wishlist;
import '../ui/workspace/workspace.dart' as workspace;
import 'routes.dart';

final routerConfig = GoRouter(
  initialLocation: Routes.root.path,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavBar(navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.wishlist.path,
              builder: (context, state) {
                return const wishlist.HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
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
          routes: [
            GoRoute(
              path: Routes.workspace.path,
              builder: (context, state) {
                return const workspace.HomeScreen();
              },
              routes: [
                GoRoute(
                  path: Routes.workspaceCreate.path,
                  builder: (context, state) {
                    return const workspace.CreateScreen();
                  },
                ),
                GoRoute(
                  path: Routes.workspaceDetails.path,
                  builder: (context, state) {
                    return const workspace.DetailsScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.stopwatch.path,
              builder: (context, state) {
                return const stopwatch.HomeView();
              },
              routes: [
                GoRoute(
                  path: Routes.stopwatchDetails.path,
                  builder: (context, state) {
                    final id = state.pathParameters['id'];
                    assert(id != null, 'The project id is required');
                    return stopwatch.DetailsView(id: id as String);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
