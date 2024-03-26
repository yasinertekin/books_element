import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';

part 'widget/book_count.dart';
part 'widget/change_language_button.dart';
part 'widget/log_out_button.dart';
part 'widget/profile_app_bar.dart';
part 'widget/user_avatar.dart';
part 'widget/user_following.dart';
part 'widget/user_info.dart';
part 'widget/user_name.dart';
part 'widget/users_friends.dart';

@RoutePage()
final class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ProfileAppBar(),
      body: _ProfileBody(),
    );
  }
}

final class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _UserInfo(),
          SizedBox(height: context.dynamicHeight(0.03)),
          const Spacer(),
          const _ChangeLanguageButton(),
          const _LogOutButton(),
        ],
      ),
    );
  }
}

final class _UserStatistics extends StatelessWidget {
  const _UserStatistics();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BookCount(),
        CustomSizedBox(
          width: 0.01,
        ),
        _VerticalDivider(),
        CustomSizedBox(
          width: 0.01,
        ),
        _UserFriends(),
        CustomSizedBox(
          width: 0.01,
        ),
        _VerticalDivider(),
        CustomSizedBox(
          width: 0.01,
        ),
        _UserFollowing(),
      ],
    );
  }
}

final class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Assets.images.imgVerticalDivider.image(
      width: 2,
      height: 41,
      fit: BoxFit.cover,
    );
  }
}
