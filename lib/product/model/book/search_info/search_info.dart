import 'package:bloc_example/feature/index.dart';

part 'search_info.g.dart';

@JsonSerializable()
@immutable
final class SearchInfo extends Equatable {
  const SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);
  @JsonKey(name: 'textSnippet')
  final String? textSnippet;

  SearchInfo copyWith({
    String? textSnippet,
  }) =>
      SearchInfo(
        textSnippet: textSnippet ?? this.textSnippet,
      );

  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);

  @override
  List<Object?> get props => [
        textSnippet,
      ];
}
