import 'package:flutter/material.dart';


import '../../../domain/models/wish.dart';
import '../../core/themes/dimension.dart';
import 'widgets/list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final wishList =  Wish.wishList ();

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
                  hintText: 'Pesquisar item',
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: Dimension.small.horizontalPadding+
                  Dimension.smallest.verticalPadding,
                  child: ListCard(
                    wish: wishList.elementAt(index),
                    onToBuyChanged: _handleToBuyChange,
                  ),
                );
              },
              childCount: wishList.length,
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

  void _handleToBuyChange(Wish wish) {
    setState(() {
      wish.isDone = !wish.isDone;
    });
  }
}
