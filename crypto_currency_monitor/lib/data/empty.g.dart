// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Empty _$EmptyFromJson(Map<String, dynamic> json) => Empty(
      decimalPlace: json['decimal_place'],
      contractAddress: json['contract_address'] as String,
    );

Map<String, dynamic> _$EmptyToJson(Empty instance) => <String, dynamic>{
      'decimal_place': instance.decimalPlace,
      'contract_address': instance.contractAddress,
    };
