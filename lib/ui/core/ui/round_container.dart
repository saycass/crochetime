import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const RoundContainer({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 4,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onDecrement,
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 28,
                    color: Color(0xff7c0515),
                  ),
                ),
                Text(
                  value,
                ),
                IconButton(
                  onPressed: onIncrement,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 28,
                    color: Color(0xff7c0515),
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
