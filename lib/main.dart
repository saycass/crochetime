import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'routing/router.dart';
import 'ui/core/themes/theme.dart';
import 'ui/core/ui/snackbar_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
