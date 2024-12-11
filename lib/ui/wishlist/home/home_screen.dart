import 'package:flutter/material.dart';

import '../../core/themes/dimension.dart';
import '../model/to_buy.dart';
import 'widgets/list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final toBuyList = ToBuy.toBuyList();

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
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: Dimension.small.circularBorder,
                  ),
                  hintText: 'Pesquisar item',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: Dimension.smaller.allPadding,
                  child: ListCard(
                    toBuy: toBuyList.elementAt(index),
                    onToBuyChanged: _handleToBuyChange,
                  ),
                );
              },
              childCount: toBuyList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void _handleToBuyChange(ToBuy tobuy) {
    setState(() {
      tobuy.isDone = !tobuy.isDone;
    });
  }
}
