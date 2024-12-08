import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class Counter extends StatelessWidget {
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const Counter({
    super.key,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: Dimension.small.verticalPadding,
          width: 240,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: Dimension.large.circularBorder,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: onDecrement,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    size: Dimension.large.size,
                  ),
                ),
              ),
              Dimension.medium.horizontal,
              Expanded(
                child: IconButton(
                  onPressed: onIncrement,
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: Dimension.large.size,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 0,
          child: Align(
            child: Container(
              height: Dimension.extraLarge.size + 10,
              width: Dimension.extraLarge.size + 10,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHigh,
                borderRadius: Dimension.large.circularBorder,
              ),
              child: Center(
                child: Text(
                  value.toString(),
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: Dimension.medium.size,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
