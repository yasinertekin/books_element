part of '../welcome_view.dart';

final class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.08),
      child: ElevatedButton(
        onPressed: () {
          context.navigateToNamedRoute(NavigationEnum.loginView.value);
        },
        child: Text(
          LocaleKeys.buttons_start,
          style: context.textTheme.headlineMedium?.copyWith(
            color: ColorName.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
    );
  }
}
