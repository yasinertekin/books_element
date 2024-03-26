import 'package:bloc_example/feature/index.dart';

part 'epub.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
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

  Map<String, dynamic> toJson() => _$EpubToJson(this);

  @override
  List<Object?> get props => [
        isAvailable,
        acsTokenLink,
      ];
}
