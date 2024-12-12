import 'package:flutter/material.dart';

import '../../../../domain/models/wish.dart';
import '../../../core/themes/dimension.dart';
import '../../../extensions/extensions.dart';

class ListCard extends StatefulWidget {
  final Wish wish;

  final void Function(Wish) onToBuyChanged;

  const ListCard({
    super.key,
    required this.onToBuyChanged,
    required this.wish,
  });

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final wishList = Wish.wishList();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Dimension.smallest.allPadding,
        child: ListTile(
          trailing: IconButton(
            onPressed: () {
              widget.onToBuyChanged(widget.wish);
            },
            icon: Icon(
              widget.wish.isDone
                  ? Icons.check_circle_outline_rounded
                  : Icons.radio_button_unchecked_rounded,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.wish.description,
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
                    widget.wish.createdAt.toString(),
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
