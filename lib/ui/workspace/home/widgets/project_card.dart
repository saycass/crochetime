import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String body;

  const ProjectCard({
    super.key,
    required this.title,
    this.body = 'Lorem ipsum dolor sit amet, consecteturt.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: Dimension.small.circularBorder,
      ),
      child: InkWell(
        onTap: () {
          context.go(Routes.workspaceDetails.withId('id'));
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: Dimension.small.circularTopBorder,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    randomImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: Dimension.small.allPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: context.textTheme.titleMedium!,
                      ),
                      Dimension.smaller.vertical,
                      Text(
                        body,
                        style: context.textTheme.labelMedium!,
                        maxLines: 2,
                      ),
                      Dimension.smallest.vertical,
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 16,
                            color: context.colorScheme.tertiaryContainer,
                          ),
                          Dimension.smaller.horizontal,
                          Text(
                            '10/03/2024',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              top: 0,
              right: 16,
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.tertiaryContainer,
                    borderRadius: Dimension.large.circularBorder,
                  ),
                  height: 24,
                  child: Center(
                    child: Padding(
                      padding: Dimension.smaller.horizontalPadding,
                      child: Text(
                        'Em progresso',
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
