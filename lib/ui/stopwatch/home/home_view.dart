import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Padding(
        padding: Dimension.medium.horizontalPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você precisa selecionar\n um projeto.',
                style: context.textTheme.headlineSmall,
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
      ),
    );
  }
}
