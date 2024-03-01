import 'package:bloc_example/feature/index.dart';

@immutable

/// Navigation Constants
final class _NavigationConstants {
  const _NavigationConstants._();

  /// Login View
  static const String loginView = '/login';

  /// Register View
  static const String registerView = '/register';

  /// Home View
  static const String homeView = '/home';

  /// Welcome View
  static const String welcomeView = '/';

  /// Search View
  static const String sarchView = '/search';
}

/// Navigation Enum
enum NavigationEnum {
  /// Login View
  loginView(
    _NavigationConstants.loginView,
  ),

  /// Register View
  registerView(
    _NavigationConstants.registerView,
  ),

  /// Home View
  homeView(
    _NavigationConstants.homeView,
  ),

  /// Welcome View
  welcomeView(
    _NavigationConstants.welcomeView,
  ),

  /// Search View
  searchView(
    _NavigationConstants.sarchView,
  );

  /// Value
  final String value;

  /// Navigation Enum
  // ignore: sort_constructors_first
  const NavigationEnum(this.value);
}
