import 'package:flutter/material.dart';
import 'package:my_movie_app/src/theme/palette.dart';

import '../core/constants.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);

    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Palette.green500.value,
          const <int, Color>{
            100: Palette.green100,
            200: Palette.green200,
            300: Palette.green300,
            400: Palette.green400,
            500: Palette.green500,
            600: Palette.green600,
            700: Palette.green700,
            800: Palette.green800,
            900: Palette.green900,
          },
        ),
        brightness: Brightness.dark,
        accentColor: Palette.green500,
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Palette.green500,
        inactiveTrackColor: Colors.white,
        thumbColor: Palette.green500,
        valueIndicatorColor: Colors.white,
        valueIndicatorTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Palette.green900,
        ),
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.textTheme
          .copyWith(
            labelLarge: theme.textTheme.labelLarge?.copyWith(
              fontFamily: 'Roboto Condensed',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: theme.textTheme.headlineMedium?.copyWith(
              fontFamily: 'Roboto Condensed',
              color: Colors.white,
            ),
            headlineSmall: theme.textTheme.headlineSmall?.copyWith(
              fontFamily: 'Roboto Condensed',
              color: Colors.white,
            ),
            bodyMedium: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'Roboto Condensed',
              color: Colors.white,
            ),
          )
          .apply(displayColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Palette.green500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            )),
      ),
    );
  }
}
