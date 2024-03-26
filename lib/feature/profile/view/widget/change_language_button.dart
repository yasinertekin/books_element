part of '../profile_view.dart';

final class _ChangeLanguageButton extends StatelessWidget {
  const _ChangeLanguageButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.locale == Locales.tr.locale) {
          ProductLocalization.updateLanguage(
            context: context,
            value: Locales.en,
          );
        } else {
          ProductLocalization.updateLanguage(
            context: context,
            value: Locales.tr,
          );
        }
      },
      child: const Text(
        'Change Language',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
