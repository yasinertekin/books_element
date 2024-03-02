import 'package:bloc_example/feature/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

final class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height = 0.2,
    super.key,
  });

  final String? imageUrl;
  final BoxFit fit;
  final double height;

  String get _imgUrl => (imageUrl?.isEmpty ?? true) ? '' : imageUrl!;

  @override
  Widget build(BuildContext context) {
    return _imgUrl.isEmpty
        ? SvgPicture.asset(
            Assets.icons.icNoImage,
            height: context.dynamicHeight(0.13),
          )
        : CachedNetworkImage(
            imageUrl: _imgUrl,
            fit: fit,
            height: context.dynamicHeight(height),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
