import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

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
      duration: const Duration(milliseconds: 600),
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
