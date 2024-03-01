import 'package:bloc_example/product/service/books_service.dart';
import 'package:dio/dio.dart';

final class DioManager {
  const DioManager._();

  static Dio DioService() {
    return Dio(
      BaseOptions(
        baseUrl: ServiceUrl.baseUrl.value,
      ),
    );
  }
}
