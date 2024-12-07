import 'package:crochetime/routing/router.dart';
import 'package:crochetime/ui/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/core/ui/snackbar_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      const CrochetTimeApp(),
    ),
  );
}

class CrochetTimeApp extends StatelessWidget {
  const CrochetTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(context.textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      routerConfig: routerConfig,
      scaffoldMessengerKey: SnackBarHelper.key,
    );
  }
}
