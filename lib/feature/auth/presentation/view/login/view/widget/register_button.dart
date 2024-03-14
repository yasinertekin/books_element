part of '../login_view.dart';

final class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => context.navigateNamedTo(
          NavigationEnum.registerView.value,
        ),
        child: const Text(
          LocaleKeys.login_dontHaveAccount,
        ).tr(),
      ),
    );
  }
}
