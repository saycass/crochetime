import 'package:crochetime/src/views/home_screen.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CrochetTimeApp extends StatelessWidget {
  const CrochetTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
