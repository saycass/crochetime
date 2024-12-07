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
            margin: const EdgeInsets.symmetric(vertical: 16),
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
    this.body = 'Lorem ipsum dolor sit amet, consecteturt. ',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHigh,
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
            Container(
              height: 100,
              width: 360,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                randomImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    body,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tempo',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      Text(
                        '01:53:00',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
