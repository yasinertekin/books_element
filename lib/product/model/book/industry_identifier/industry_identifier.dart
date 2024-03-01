import 'package:bloc_example/feature/index.dart';

part 'industry_identifier.g.dart';

@immutable
@JsonSerializable()
final class IndustryIdentifier extends Equatable {
  const IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifierFromJson(json);
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'identifier')
  final String? identifier;

  IndustryIdentifier copyWith({
    String? type,
    String? identifier,
  }) =>
      IndustryIdentifier(
        type: type ?? this.type,
        identifier: identifier ?? this.identifier,
      );

  Map<String, dynamic> toJson() => _$IndustryIdentifierToJson(this);

  @override
  List<Object?> get props => [
        type,
        identifier,
      ];
}
