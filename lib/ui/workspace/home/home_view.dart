import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimension.dart';
import 'widgets/project_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus projetos'),
        actions: [
          IconButton(
            onPressed: () {
              context.go(Routes.workspaceCreate.complete);
            },
            icon: const Icon(
              Icons.add_circle_sharp,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: Dimension.medium.allPadding,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: Dimension.small.verticalPadding,
            child: ProjectCard(
              title: 'Projeto  ${index + 1}',
            ),
          );
        },
      ),
    );
  }
}
