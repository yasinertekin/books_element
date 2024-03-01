import 'package:bloc_example/feature/index.dart';

part 'image_links.g.dart';

@immutable
@JsonSerializable()
final class ImageLinks extends Equatable {
  const ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
  @JsonKey(name: 'smallThumbnail')
  final String? smallThumbnail;
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;

  ImageLinks copyWith({
    String? smallThumbnail,
    String? thumbnail,
  }) =>
      ImageLinks(
        smallThumbnail: smallThumbnail ?? this.smallThumbnail,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);

  @override
  List<Object?> get props => [
        smallThumbnail,
        thumbnail,
      ];
}
