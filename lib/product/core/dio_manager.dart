import 'package:bloc_example/feature/index.dart';

@immutable

/// Dio Manager
final class DioManager {
  /// Dio Manager Factory
  factory DioManager() {
    _instance ??= DioManager._();
    return _instance!;
  }

  DioManager._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ServiceUrl.baseUrl.value,
      ),
    );
  }
  static DioManager? _instance;
  late final Dio _dio;

  /// Dio
  Dio get dio => _dio;
}
