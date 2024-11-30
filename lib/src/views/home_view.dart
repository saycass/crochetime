import 'package:animate_do/animate_do.dart';
import 'package:crochetime/src/widgets/crochet_pattern_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hora do Crochê ",
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            var card = const CrochetPatternCard(
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rtl_rounded),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_rounded,
            ),
            label: 'Salvos',
          ),
        ],
      ),
    );
  }
}
