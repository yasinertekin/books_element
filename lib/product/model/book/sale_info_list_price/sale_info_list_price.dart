import 'package:bloc_example/feature/index.dart';

part 'sale_info_list_price.g.dart';

@JsonSerializable()
@immutable
final class SaleInfoListPrice extends Equatable {
  const SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoListPriceFromJson(json);
  @JsonKey(name: 'amount')
  final double? amount;
  @JsonKey(name: 'currencyCode')
  final String? currencyCode;

  SaleInfoListPrice copyWith({
    double? amount,
    String? currencyCode,
  }) =>
      SaleInfoListPrice(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() => _$SaleInfoListPriceToJson(this);

  @override
  List<Object?> get props => [
        amount,
        currencyCode,
      ];
}
