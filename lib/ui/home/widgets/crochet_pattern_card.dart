import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimension.dart';

class CrochetPatternCard extends StatelessWidget {
  final String title;
  final String description;

  const CrochetPatternCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(
        Routes.exploreDetails('mock'),
      ),
      child: Card(
        child: Padding(
          padding: Dimension.smallest.allPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16),
              Container(
                color: Colors.grey,
                height: 175,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
