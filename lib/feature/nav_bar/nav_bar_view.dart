import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/router/app_router.gr.dart';

@RoutePage()
final class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final Key myWidgetKey = UniqueKey();

    return AutoTabsScaffold(
      routes: const [
        SearchRoute(),
        HomeRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          key: myWidgetKey,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.post_add)),
          ],
        );
      },
    );
  }
}
