import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/themes/dimension.dart';
import '../../core/ui/image_loading.dart';
import '../../extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                childCount: List.generate(18, (index) => 'Item $index').length,
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // GoRouter.of(context).go(Routes.exploreDetails.path);
                    },
                    child: Image.network(
                      randomImage,
                      fit: BoxFit.cover,
                      frameBuilder: (_, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          child: frame != null ? child : const ImageLoading(),
                        );
                      },
                    ),
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
