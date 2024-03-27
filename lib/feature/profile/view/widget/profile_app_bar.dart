part of '../profile_view.dart';

final class _ProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    onPressed: () async {
                      if (context.locale == Locales.tr.locale) {
                        await ProductLocalization.updateLanguage(
                          context: context,
                          value: Locales.en,
                        );
                      } else {
                        await ProductLocalization.updateLanguage(
                          context: context,
                          value: Locales.tr,
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Change Language'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      context.router.replace(const LoginRoute());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ],
      title: const Text('Readium'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
