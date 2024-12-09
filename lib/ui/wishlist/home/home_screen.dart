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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Wishlist'),
            pinned: true,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimension.small.allPadding,
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Pesquisar item",
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: Dimension.smaller.allPadding,
                  child: const ListCard(),
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
