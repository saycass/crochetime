import 'package:flutter/material.dart';

import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';

class ProgressCard extends StatelessWidget {
  final String label;
  final String value;

  const ProgressCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimension.small.allPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHigh,
        borderRadius: Dimension.small.circularBorder,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: context.textTheme.labelLarge!,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge!,
          ),
        ],
      ),
    );
  }
}
