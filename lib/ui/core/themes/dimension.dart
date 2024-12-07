import 'package:flutter/material.dart';

class Dimension {
  final double _value;

  const Dimension._(this._value);

  static const extraLarge = Dimension._(56);

  static const largest = Dimension._(48);

  static const larger = Dimension._(40);

  static const large = Dimension._(32);

  static const medium = Dimension._(24);

  static const small = Dimension._(16);

  static const smaller = Dimension._(8);

  static const smallest = Dimension._(4);

  SizedBox get vertical => SizedBox(height: _value);

  SizedBox get horizontal => SizedBox(width: _value);

  EdgeInsets get allPadding => EdgeInsets.symmetric(
        horizontal: _value,
        vertical: _value,
      );

  EdgeInsets get verticalPadding => bottomPadding + topPadding;

  EdgeInsets get horizontalPadding => leftPadding + rightPadding;

  EdgeInsets get topPadding => EdgeInsets.only(top: _value);

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: _value);

  EdgeInsets get leftPadding => EdgeInsets.only(left: _value);

  EdgeInsets get rightPadding => EdgeInsets.only(right: _value);

  BorderRadius get circularBorder => BorderRadius.circular(_value);

  BorderRadius get circularTopBorder => BorderRadius.only(
        topLeft: Radius.circular(_value),
        topRight: Radius.circular(_value),
      );

  BorderRadius get circularBottomBorder => BorderRadius.only(
        bottomLeft: Radius.circular(_value),
        bottomRight: Radius.circular(_value),
      );
}
