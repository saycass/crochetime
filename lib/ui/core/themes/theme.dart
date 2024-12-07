import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff78008d),
      surfaceTint: Color(0xff9b21b1),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa730bd),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff814989),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffcbdff),
      onSecondaryContainer: Color(0xff5d2865),
      tertiary: Color(0xff8c0042),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc22a65),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff211921),
      onSurfaceVariant: Color(0xff514251),
      outline: Color(0xff837282),
      outlineVariant: Color(0xffd5c0d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372d36),
      inversePrimary: Color(0xfff8acff),
      primaryFixed: Color(0xffffd6ff),
      onPrimaryFixed: Color(0xff350040),
      primaryFixedDim: Color(0xfff8acff),
      onPrimaryFixedVariant: Color(0xff7b0090),
      secondaryFixed: Color(0xffffd6ff),
      onSecondaryFixed: Color(0xff350040),
      secondaryFixedDim: Color(0xfff3b0f8),
      onSecondaryFixedVariant: Color(0xff67316f),
      tertiaryFixed: Color(0xffffd9e0),
      onTertiaryFixed: Color(0xff3f001a),
      tertiaryFixedDim: Color(0xffffb1c4),
      onTertiaryFixedVariant: Color(0xff8f0043),
      surfaceDim: Color(0xffe5d6e2),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffeffb),
      surfaceContainer: Color(0xfff9e9f6),
      surfaceContainerHigh: Color(0xfff4e4f0),
      surfaceContainerHighest: Color(0xffeedeea),
    );
  }

  ThemeData light() => theme(lightScheme());

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8acff),
      surfaceTint: Color(0xfff8acff),
      onPrimary: Color(0xff570067),
      primaryContainer: Color(0xff9d24b4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xfff3b0f8),
      onSecondary: Color(0xff4e1957),
      secondaryContainer: Color(0xff622d6a),
      onSecondaryContainer: Color(0xfffdc8ff),
      tertiary: Color(0xffffb1c4),
      onTertiary: Color(0xff65002e),
      tertiaryContainer: Color(0xffb61f5c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff191119),
      onSurface: Color(0xffeedeea),
      onSurfaceVariant: Color(0xffd5c0d2),
      outline: Color(0xff9d8b9c),
      outlineVariant: Color(0xff514251),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeedeea),
      inversePrimary: Color(0xff9b21b1),
      primaryFixed: Color(0xffffd6ff),
      onPrimaryFixed: Color(0xff350040),
      primaryFixedDim: Color(0xfff8acff),
      onPrimaryFixedVariant: Color(0xff7b0090),
      secondaryFixed: Color(0xffffd6ff),
      onSecondaryFixed: Color(0xff350040),
      secondaryFixedDim: Color(0xfff3b0f8),
      onSecondaryFixedVariant: Color(0xff67316f),
      tertiaryFixed: Color(0xffffd9e0),
      onTertiaryFixed: Color(0xff3f001a),
      tertiaryFixedDim: Color(0xffffb1c4),
      onTertiaryFixedVariant: Color(0xff8f0043),
      surfaceDim: Color(0xff191119),
      surfaceBright: Color(0xff40363f),
      surfaceContainerLowest: Color(0xff130c14),
      surfaceContainerLow: Color(0xff211921),
      surfaceContainer: Color(0xff251d25),
      surfaceContainerHigh: Color(0xff302730),
      surfaceContainerHighest: Color(0xff3b323b),
    );
  }

  ThemeData dark() => theme(darkScheme());

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.primary),
      );
}

extension TextThemeExtensions on BuildContext {
  TextTheme get textTheme {
    final baseTextTheme = Theme.of(this).textTheme;
    final bodyTextTheme = GoogleFonts.getTextTheme(
      'Roboto',
      baseTextTheme,
    );
    final displayTextTheme = GoogleFonts.getTextTheme(
      'Pacifico',
      baseTextTheme,
    );
    return displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
  }
}
