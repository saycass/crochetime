import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../../extensions/extensions.dart';

class TitledHorizontalList extends StatelessWidget {
  final List items;
  final String title;
  final VoidCallback onTap;

  const TitledHorizontalList({
    super.key,
    required this.title,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHigh,
        borderRadius: Dimension.small.circularBorder,
      ),
      child: Padding(
        padding: Dimension.small.allPadding,
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.textTheme.headlineSmall!,
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            Dimension.medium.vertical,
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    margin: Dimension.smaller.horizontalPadding,
                    decoration: BoxDecoration(
                      borderRadius: Dimension.small.circularBorder,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      randomImage,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
