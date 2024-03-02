import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/image_links/image_links.dart';
import 'package:bloc_example/product/model/book/industry_identifier/industry_identifier.dart';
import 'package:bloc_example/product/model/book/panelization_summary/panelization_summary.dart';
import 'package:bloc_example/product/model/book/reading_modes/reading_modes.dart';

part 'volume_info.g.dart';

@JsonSerializable()
@immutable
final class VolumeInfo extends Equatable {
  const VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'subtitle')
  final String? subtitle;
  @JsonKey(name: 'authors')
  final List<String>? authors;
  @JsonKey(name: 'publisher')
  final String? publisher;
  @JsonKey(name: 'publishedDate')
  final String? publishedDate;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'industryIdentifiers')
  final List<IndustryIdentifier>? industryIdentifiers;
  @JsonKey(name: 'readingModes')
  final ReadingModes? readingModes;
  @JsonKey(name: 'pageCount')
  final int? pageCount;
  @JsonKey(name: 'printType')
  final String? printType;
  @JsonKey(name: 'categories')
  final List<String>? categories;
  @JsonKey(name: 'averageRating')
  final double? averageRating;
  @JsonKey(name: 'ratingsCount')
  final int? ratingsCount;
  @JsonKey(name: 'maturityRating')
  final String? maturityRating;
  @JsonKey(name: 'allowAnonLogging')
  final bool? allowAnonLogging;
  @JsonKey(name: 'contentVersion')
  final String? contentVersion;
  @JsonKey(name: 'panelizationSummary')
  final PanelizationSummary? panelizationSummary;
  @JsonKey(name: 'imageLinks')
  final ImageLinks? imageLinks;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'previewLink')
  final String? previewLink;
  @JsonKey(name: 'infoLink')
  final String? infoLink;
  @JsonKey(name: 'canonicalVolumeLink')
  final String? canonicalVolumeLink;

  VolumeInfo copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    int? pageCount,
    String? printType,
    List<String>? categories,
    double? averageRating,
    int? ratingsCount,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) =>
      VolumeInfo(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        publisher: publisher ?? this.publisher,
        publishedDate: publishedDate ?? this.publishedDate,
        description: description ?? this.description,
        industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
        readingModes: readingModes ?? this.readingModes,
        pageCount: pageCount ?? this.pageCount,
        printType: printType ?? this.printType,
        categories: categories ?? this.categories,
        averageRating: averageRating ?? this.averageRating,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        maturityRating: maturityRating ?? this.maturityRating,
        allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
        contentVersion: contentVersion ?? this.contentVersion,
        panelizationSummary: panelizationSummary ?? this.panelizationSummary,
        imageLinks: imageLinks ?? this.imageLinks,
        language: language ?? this.language,
        previewLink: previewLink ?? this.previewLink,
        infoLink: infoLink ?? this.infoLink,
        canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
      );

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);

  @override
  List<Object?> get props => [
        title,
        subtitle,
        authors,
        publisher,
        publishedDate,
        description,
        industryIdentifiers,
        readingModes,
        pageCount,
        printType,
        categories,
        averageRating,
        ratingsCount,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        panelizationSummary,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink,
      ];
}
