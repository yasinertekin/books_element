part of '../profile_view.dart';

final class _ChangeLanguageButton extends StatelessWidget {
  const _ChangeLanguageButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Change Language',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
