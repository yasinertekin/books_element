import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          page: WelcomeRoute.page,
          path: NavigationEnum.welcomeView.value,
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
          path: NavigationEnum.loginView.value,
        ),
        AdaptiveRoute(
          page: RegisterRoute.page,
          path: NavigationEnum.registerView.value,
        ),
        AdaptiveRoute(
          initial: true,
          page: NavBarRoute.page,
          path: NavigationEnum.navBarView.value,
          children: [
            AdaptiveRoute(
              page: HomeRoute.page,
              path: NavigationEnum.homeView.value,
            ),
            AdaptiveRoute(
              page: SearchRoute.page,
              path: NavigationEnum.searchView.value,
            ),
          ],
        ),
      ];
}
