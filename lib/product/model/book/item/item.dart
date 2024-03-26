import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/access_info/access_info.dart';
import 'package:bloc_example/product/model/book/sale_info/sale_info.dart';
import 'package:bloc_example/product/model/book/search_info/search_info.dart';
import 'package:bloc_example/product/model/book/volume_info/volume_info.dart';

part 'item.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
@immutable
final class Item extends Equatable {
  const Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'etag')
  final String? etag;
  @JsonKey(name: 'selfLink')
  final String? selfLink;
  @JsonKey(name: 'volumeInfo')
  final VolumeInfo? volumeInfo;
  @JsonKey(name: 'saleInfo')
  final SaleInfo? saleInfo;
  @JsonKey(name: 'accessInfo')
  final AccessInfo? accessInfo;
  @JsonKey(name: 'searchInfo')
  final SearchInfo? searchInfo;

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [
        kind,
        id,
        etag,
        selfLink,
        volumeInfo,
        saleInfo,
        accessInfo,
        searchInfo,
      ];
}
