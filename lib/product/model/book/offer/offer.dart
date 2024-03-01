import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/offer_list_price/offfer_list_price.dart';

part 'offer.g.dart';

@JsonSerializable()
@immutable
final class Offer extends Equatable {
  const Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  @JsonKey(name: 'finskyOfferType')
  final int? finskyOfferType;
  @JsonKey(name: 'listPrice')
  final OfferListPrice? listPrice;
  @JsonKey(name: 'retailPrice')
  final OfferListPrice? retailPrice;

  Offer copyWith({
    int? finskyOfferType,
    OfferListPrice? listPrice,
    OfferListPrice? retailPrice,
  }) =>
      Offer(
        finskyOfferType: finskyOfferType ?? this.finskyOfferType,
        listPrice: listPrice ?? this.listPrice,
        retailPrice: retailPrice ?? this.retailPrice,
      );

  Map<String, dynamic> toJson() => _$OfferToJson(this);

  @override
  List<Object?> get props => [
        finskyOfferType,
        listPrice,
        retailPrice,
      ];
}
