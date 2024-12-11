import 'package:flutter/material.dart';

import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';
import '../../model/to_buy.dart';

class ListCard extends StatefulWidget {
  final ToBuy toBuy;

  final void Function(ToBuy) onToBuyChanged;

  const ListCard({
    super.key,
    required this.toBuy,
    required this.onToBuyChanged,
  });

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final toBuyList = ToBuy.toBuyList();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Dimension.smallest.allPadding,
        child: ListTile(
          trailing: IconButton(
            onPressed: () {
              widget.onToBuyChanged(widget.toBuy);
            },
            icon: Icon(
              widget.toBuy.isDone
                  ? Icons.check_circle_outline_rounded
                  : Icons.radio_button_unchecked_rounded,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.toBuy.description,
                maxLines: 1,
                style: context.textTheme.titleMedium!,
              ),
              // Dimension.smaller.vertical,
              // // Text(
              // //   subtitle,
              // //   maxLines: 2,
              // //   style: context.textTheme.labelMedium!,
              // // ),
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
                    widget.toBuy.createdAt.toString(),
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
