import 'package:flutter/material.dart';

import '../helper/navigation_helper.dart';
import '../helper/snackbar_helper.dart';
import '../theme/theme.dart';
import '../views/home_view.dart';
import '../views/invalid_route_view.dart';
import '../views/login_view.dart';

class CrochetTimeApp extends StatelessWidget {
  const CrochetTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hora do Crochê',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.login,
      scaffoldMessengerKey: SnackbarHelper.key,
      navigatorKey: NavigationHelper.key,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class Routes {
  const Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(widget: const LoginPage());
      case AppRoutes.home:
        return getRoute(widget: const HomeView());
      default:
        return getRoute(widget: const InvalidRouteView());
    }
  }
}

class AppRoutes {

  const AppRoutes._();

  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
}
