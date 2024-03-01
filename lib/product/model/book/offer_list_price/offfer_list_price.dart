import 'package:bloc_example/feature/index.dart';

part 'offfer_list_price.g.dart';

@JsonSerializable()
@immutable
final class OfferListPrice extends Equatable {
  const OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  factory OfferListPrice.fromJson(Map<String, dynamic> json) =>
      _$OfferListPriceFromJson(json);
  @JsonKey(name: 'amountInMicros')
  final int? amountInMicros;
  @JsonKey(name: 'currencyCode')
  final String? currencyCode;

  OfferListPrice copyWith({
    int? amountInMicros,
    String? currencyCode,
  }) =>
      OfferListPrice(
        amountInMicros: amountInMicros ?? this.amountInMicros,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() => _$OfferListPriceToJson(this);

  @override
  List<Object?> get props => [
        amountInMicros,
        currencyCode,
      ];
}
