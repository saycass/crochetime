import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/crochet_pattern_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            const card = CrochetPatternCard(
              title: 'Cachecol',
              description: 'Cachecol de crochê',
            );
            if (index % 2 != 0) {
              return FadeInUp(
                duration: const Duration(seconds: 1),
                child: Transform.translate(
                  offset: const Offset(0.0, 50.0),
                  child: card,
                ),
              );
            } else {
              return FadeInDown(
                duration: const Duration(seconds: 1),
                child: card,
              );
            }
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .5,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
        ),
      ),
    );
  }
}
