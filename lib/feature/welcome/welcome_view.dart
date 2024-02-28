import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/gen/index.dart';
import 'package:bloc_example/product/core/constants/navigation_constants.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';
import 'package:bloc_example/product/initialize/language/locale_keys.g.dart';
import 'package:bloc_example/product/mixin/navigation_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'widget/login_button.dart';
part 'widget/start_button.dart';
part 'widget/welcome_view_background_image.dart';
part 'widget/welcome_view_title.dart';

@RoutePage()

/// Welcome View
final class WelcomeView extends StatelessWidget {
  /// Welcome View
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _WelcomeViewBackgroundImage(),
          _WelcomeViewBody(),
        ],
      ),
    );
  }
}

final class _WelcomeViewBody extends StatelessWidget {
  const _WelcomeViewBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingAllDefault.copyWith(
          top: context.height * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 9,
            ),
            const _WelcomeViewTitle(),
            const Spacer(
              flex: 5,
            ),
            const _StartButton(),
            const Spacer(),
            const Text(
              LocaleKeys.register_alreadyHaveAccount,
            ).tr(),
            const Spacer(),
            const _LoginButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
