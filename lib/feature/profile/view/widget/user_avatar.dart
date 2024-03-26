part of '../profile_view.dart';

final class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: ColorName.colorSpanishWhite,
      child: FirebaseAuth.instance.currentUser?.photoURL != null
          ? Image.network(
              FirebaseAuth.instance.currentUser!.photoURL.toString(),
              fit: BoxFit.cover,
            )
          : const Center(
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
    );
  }
}
