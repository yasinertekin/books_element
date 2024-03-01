import 'package:bloc_example/feature/index.dart';

@immutable

/// Application Initialize
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  Future<void> _initialize() async {
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

    /// Firebase initialize
    await Firebase.initializeApp();

    /// Dependency Injection
    await Locator.setup();
  }
}
