import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/product/router/app_router.gr.dart';
import 'package:bloc_example/product/router/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          initial: true,
          page: LoginRoute.page,
          guards: [AuthGuard()],
        ),
        AdaptiveRoute(page: RegisterRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
      ];
}
