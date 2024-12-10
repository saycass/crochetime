import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

const _duration = Duration(milliseconds: 600);

class RemoteImage extends StatelessWidget {
  const RemoteImage(
    this.src, {
    super.key,
    this.fit,
  });

  final String src;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: fit ?? BoxFit.cover,
      frameBuilder: (_, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedSwitcher(
          duration: _duration,
          layoutBuilder: (currentChild, previousChildren) =>
              currentChild ?? previousChildren.last,
          child: frame != null ? child : const ImageLoading(),
        );
      },
    );
  }
}

class ImageLoading extends StatefulWidget {
  const ImageLoading({super.key});

  @override
  State<ImageLoading> createState() => _ImageLoadingState();
}

class _ImageLoadingState extends State<ImageLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.2, end: 1.0).animate(_controller),
      alwaysIncludeSemantics: true,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: context.colorScheme.surfaceContainer,
      ),
    );
  }
}
