part of '../home_view.dart';

final class _HomeViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _HomeViewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(LocaleKeys.home_title).tr(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
