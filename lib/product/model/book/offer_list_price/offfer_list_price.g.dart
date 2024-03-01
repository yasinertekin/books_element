// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offfer_list_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferListPrice _$OfferListPriceFromJson(Map<String, dynamic> json) =>
    OfferListPrice(
      amountInMicros: json['amountInMicros'] as int?,
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$OfferListPriceToJson(OfferListPrice instance) =>
    <String, dynamic>{
      'amountInMicros': instance.amountInMicros,
      'currencyCode': instance.currencyCode,
    };
