import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/epub/epub.dart';

part 'access_info.g.dart';

@immutable
@JsonSerializable(
  explicitToJson: true,
)
final class AccessInfo extends Equatable {
  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'viewability')
  final String? viewability;
  @JsonKey(name: 'embeddable')
  final bool? embeddable;
  @JsonKey(name: 'publicDomain')
  final bool? publicDomain;
  @JsonKey(name: 'textToSpeechPermission')
  final String? textToSpeechPermission;
  @JsonKey(name: 'epub')
  final Epub? epub;
  @JsonKey(name: 'pdf')
  final Epub? pdf;
  @JsonKey(name: 'webReaderLink')
  final String? webReaderLink;
  @JsonKey(name: 'accessViewStatus')
  final String? accessViewStatus;
  @JsonKey(name: 'quoteSharingAllowed')
  final bool? quoteSharingAllowed;

  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);

  @override
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        textToSpeechPermission,
        epub,
        pdf,
        webReaderLink,
        accessViewStatus,
        quoteSharingAllowed,
      ];
}
