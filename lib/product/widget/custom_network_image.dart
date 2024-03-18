import 'package:bloc_example/feature/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays an image from the network.
final class CustomNetworkImage extends StatelessWidget {
  /// Creates a widget that displays an image from the network.
  const CustomNetworkImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height = 0.2,
    super.key,
    this.width = 0.4,
    this.borderRadius = 8,
    this.icNoImageHeight = 0.08,
  });

  /// The URL of the image to display.
  final String? imageUrl;

  /// How the image should be inscribed into the box.
  final BoxFit fit;

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  String get _imgUrl => (imageUrl?.isEmpty ?? true) ? '' : imageUrl!;

  /// The radius of the image.
  final double borderRadius;

  /// The height of the no image icon.
  final double icNoImageHeight;

  @override
  Widget build(BuildContext context) {
    return _imgUrl.isEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SvgPicture.asset(
              Assets.icons.icNoImage,
              height: context.dynamicHeight(icNoImageHeight),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: _imgUrl,
              fit: fit,
              width: context.dynamicWidth(width),
              height: context.dynamicHeight(height),
              placeholder: (context, url) =>
                  const Center(child: CustomLoading()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
  }
}
