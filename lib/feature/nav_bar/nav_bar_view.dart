import 'package:bloc_example/feature/index.dart';

@RoutePage()
final class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final Key myWidgetKey = UniqueKey();

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          key: myWidgetKey,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: LocaleKeys.navbar_home.tr(),
              icon: const Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.navbar_search.tr(),
              icon: const Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: LocaleKeys.navbar_profile.tr(),
              icon: const Icon(Icons.person),
            ),
          ],
        );
      },
    );
  }
}
