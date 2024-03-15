part of '../book_detail_view.dart';

final class _BookDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _BookDetailAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const _NavigateBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final class _NavigateBackButton extends StatelessWidget {
  const _NavigateBackButton();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: ColorName.colorSpanishWhite,
        ),
      ),
      elevation: 0,
      child: const _NavigateBackButtonIcon(),
    );
  }
}

final class _NavigateBackButtonIcon extends StatelessWidget {
  const _NavigateBackButtonIcon();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: ColorName.colorBlue,
      ),
      onPressed: () {
        context.popRoute();
      },
    );
  }
}
