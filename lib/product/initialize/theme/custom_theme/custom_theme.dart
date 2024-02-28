import 'package:bloc_example/index.dart';
import 'package:bloc_example/product/initialize/theme/app_theme/app_theme.dart';

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
}
