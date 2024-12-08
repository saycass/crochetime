import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import 'widgets/list_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: ListView.builder(
        padding: Dimension.small.horizontalPadding,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: Dimension.smaller.verticalPadding,
            child: const ListCard(
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
