import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/product/core/constants/navigation_constants.dart';
import 'package:bloc_example/product/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          initial: true,
          page: LoginRoute.page,
          path: NavigationConstants.loginView,
        ),
        AdaptiveRoute(
          page: RegisterRoute.page,
          path: NavigationConstants.registerView,
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: NavigationConstants.homeView,
        ),
      ];
}
