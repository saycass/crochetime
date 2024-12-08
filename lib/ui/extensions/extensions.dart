import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double heightFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).height * sizeFraction;

  double widthFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).width * sizeFraction;
}

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

String get randomImage {
  final random = Random();
  final images = [
    'https://i.pinimg.com/736x/49/d8/26/49d826447cf83fdec134b6f05af6bd45.jpg',
    'https://i.pinimg.com/736x/ec/e8/c6/ece8c6f69e09547ebcfddbde4c32734d.jpg',
    'https://i.pinimg.com/736x/f5/d7/a6/f5d7a6e22f62a08f4f16ff26c9bd52f2.jpg',
  ];
  return images[random.nextInt(images.length)];
}
