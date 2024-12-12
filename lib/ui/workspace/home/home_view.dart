import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/project.dart';
import '../../../routing/routes.dart';
import '../../core/themes/dimension.dart';
import 'widgets/project_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final projectList = Project.projectList();
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
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: Dimension.small.verticalPadding,
            child: ProjectCard(
              project: projectList.elementAt(index),
                inProgressChanged: _handleInProgress
            )
          );
        },
      ),
    );
  }

  void _handleInProgress(Project project) {
    setState(() {
      project.inProgress = !project.inProgress;
    });
  }

}
