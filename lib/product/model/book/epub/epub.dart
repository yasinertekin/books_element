import 'package:bloc_example/feature/index.dart';

part 'epub.g.dart';

@JsonSerializable()
@immutable
final class Epub extends Equatable {
  const Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);
  @JsonKey(name: 'isAvailable')
  final bool? isAvailable;
  @JsonKey(name: 'acsTokenLink')
  final String? acsTokenLink;

  Epub copyWith({
    bool? isAvailable,
    String? acsTokenLink,
  }) =>
      Epub(
        isAvailable: isAvailable ?? this.isAvailable,
        acsTokenLink: acsTokenLink ?? this.acsTokenLink,
      );

  Map<String, dynamic> toJson() => _$EpubToJson(this);

  @override
  List<Object?> get props => [
        isAvailable,
        acsTokenLink,
      ];
}
