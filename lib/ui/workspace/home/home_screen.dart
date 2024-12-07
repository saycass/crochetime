import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../extensions/extensions.dart';
import '../../home/home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ProjectCard(
              title: 'Projeto  ${index + 1}',
            ),
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String body;

  const ProjectCard({
    super.key,
    required this.title,
    this.body = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top:8),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          context.go(Routes.workspaceDetails('mock'));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 85),

              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    randomImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    body,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Tempo dedicado',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 120),
                Text(
                  '01:53:00',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
