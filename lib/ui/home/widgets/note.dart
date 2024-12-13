import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class Note extends StatelessWidget {
  final IconData icon;
  final String text;

  const Note({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Dimension.small.allPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: Dimension.small.circularBorder,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.colorScheme.onTertiaryContainer,
          ),
          Dimension.smaller.horizontal,
          Flexible(
            child: Text(
              text,
              style: context.textTheme.bodySmall!,
            ),
          ),
        ],
      ),
    );
  }
}
