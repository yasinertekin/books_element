part of '../login_view.dart';

final class _RegisterButton extends StatelessWidget with NavigationMixin {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => navigateToNamedRoute(
          context,
          NavigationEnum.registerView.value,
        ),
        child: const Text(
          LocaleKeys.login_dontHaveAccount,
        ).tr(),
      ),
    );
  }
}
