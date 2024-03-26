import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/initialize/theme/app_theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

part 'style/app_bar_theme.dart';
part 'style/button_style.dart';
part 'style/outlined_input_border.dart';
part 'style/text_theme.dart';

/// Custom Theme
@immutable
final class CustomTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
        inputDecorationTheme: inputDecorationTheme,
        scaffoldBackgroundColor: ColorName.colorFoggyPith,
        elevatedButtonTheme: elevatedButtonThemeData,
        textTheme: textTheme,
        fontFamily: GoogleFonts.suezOne().fontFamily,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
        enabledBorder: _OutlineInputBorder(),
        border: _OutlineInputBorder(),
        focusedBorder: _OutlineInputBorder(),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: _ButtonStyle(),
      );

  @override
  TextTheme get textTheme => const _TextTheme();

  @override
  AppBarTheme get appBarTheme => const _AppBarTheme();

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      const BottomNavigationBarThemeData(
        backgroundColor: ColorName.colorFoggyPith,
        selectedItemColor: ColorName.colorBlue,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(
          color: ColorName.colorBlue,
        ),
        elevation: 0,
      );
}
