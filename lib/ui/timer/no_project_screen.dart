import 'package:flutter/material.dart';

import '../core/themes/dimension.dart';
import '../extensions/extensions.dart';

class NoProjectScreen extends StatelessWidget {
  const NoProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Padding(
        padding: Dimension.medium.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você precisa selecionar um projeto para iniciar o timer.',
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Dimension.large.vertical,
            Icon(
              Icons.watch_later_outlined,
              size: Dimension.extraLarge.size,
            ),
          ],
        ),
      ),
    );
  }
}
