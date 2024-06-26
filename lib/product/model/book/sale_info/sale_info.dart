import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/offer/offer.dart';
import 'package:bloc_example/product/model/book/sale_info_list_price/sale_info_list_price.dart';

part 'sale_info.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
@immutable
final class SaleInfo extends Equatable {
  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'saleability')
  final String? saleability;
  @JsonKey(name: 'isEbook')
  final bool? isEbook;
  @JsonKey(name: 'listPrice')
  final SaleInfoListPrice? listPrice;
  @JsonKey(name: 'retailPrice')
  final SaleInfoListPrice? retailPrice;
  @JsonKey(name: 'buyLink')
  final String? buyLink;
  @JsonKey(name: 'offers')
  final List<Offer>? offers;

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);

  @override
  List<Object?> get props => [
        country,
        saleability,
        isEbook,
        listPrice,
        retailPrice,
        buyLink,
        offers,
      ];
}
