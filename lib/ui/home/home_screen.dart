import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import 'home_viewmodel.dart';
import 'widgets/crochet_pattern_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hora do Crochê ",
        ),
      ),
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text("Seus projetos"),
              IconButton(onPressed:  () => context.go(Routes.explore),
                  icon: const Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ],
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


