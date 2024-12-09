import 'package:flutter/material.dart';

import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String data;
  const ListCard({
    super.key,
    this.title = 'Comprar linha amigurumi',
    this.subtitle = 'Cores: branco, azul, amarelo e vermelho',
    this.data = '20/12/2023',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Dimension.smallest.allPadding,
        child: ListTile(
          trailing: Icon(
            Icons.star_border_purple500_rounded,
            color: context.colorScheme.tertiaryContainer,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: context.textTheme.titleMedium!,
              ),
              Dimension.smaller.vertical,
              Text(
                subtitle,
                maxLines: 2,
                style: context.textTheme.labelMedium!,
              ),
              Dimension.smaller.vertical,
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 16,
                    color: context.colorScheme.tertiaryContainer,
                  ),
                  Dimension.smaller.horizontal,
                  Text(
                    data,
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
