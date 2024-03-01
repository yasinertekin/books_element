import 'package:bloc_example/feature/index.dart';

part 'panelization_summary.g.dart';

@immutable
@JsonSerializable()
final class PanelizationSummary extends Equatable {
  const PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);
  @JsonKey(name: 'containsEpubBubbles')
  final bool? containsEpubBubbles;
  @JsonKey(name: 'containsImageBubbles')
  final bool? containsImageBubbles;

  PanelizationSummary copyWith({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) =>
      PanelizationSummary(
        containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
        containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
      );

  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);

  @override
  List<Object?> get props => [
        containsEpubBubbles,
        containsImageBubbles,
      ];
}
