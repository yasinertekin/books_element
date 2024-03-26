part of '../profile_view.dart';

final class _ProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Readium'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
