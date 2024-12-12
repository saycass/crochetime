import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimension.dart';
import '../../core/ui/remote_image.dart';
import '../../extensions/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: List.generate(100, (index) => 'Item $index').length,
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.go(Routes.exploreDetails.withId('mock'));
                    },
                    child: RemoteImage(randomImage),
                  );
                },
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: Dimension.smallest.size,
                crossAxisSpacing: Dimension.smallest.size,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
