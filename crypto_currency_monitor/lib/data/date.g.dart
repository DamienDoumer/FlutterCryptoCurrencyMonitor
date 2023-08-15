// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      eth: DateTime.parse(json['eth'] as String),
      eur: DateTime.parse(json['eur'] as String),
      gbp: DateTime.parse(json['gbp'] as String),
      usd: DateTime.parse(json['usd'] as String),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'eth': instance.eth.toIso8601String(),
      'eur': instance.eur.toIso8601String(),
      'gbp': instance.gbp.toIso8601String(),
      'usd': instance.usd.toIso8601String(),
    };
