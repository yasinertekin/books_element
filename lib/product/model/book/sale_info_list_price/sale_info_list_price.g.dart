// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_list_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoListPrice _$SaleInfoListPriceFromJson(Map<String, dynamic> json) =>
    SaleInfoListPrice(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$SaleInfoListPriceToJson(SaleInfoListPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };
