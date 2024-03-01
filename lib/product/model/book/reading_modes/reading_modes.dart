import 'package:bloc_example/feature/index.dart';

part 'reading_modes.g.dart';

@JsonSerializable()
@immutable
@JsonSerializable()
final class ReadingModes extends Equatable {
  const ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);
  @JsonKey(name: 'text')
  final bool? text;
  @JsonKey(name: 'image')
  final bool? image;

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) =>
      ReadingModes(
        text: text ?? this.text,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);

  @override
  List<Object?> get props => [
        text,
        image,
      ];
}
