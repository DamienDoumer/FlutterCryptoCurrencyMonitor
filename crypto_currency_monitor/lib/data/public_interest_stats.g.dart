// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_interest_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicInterestStats _$PublicInterestStatsFromJson(Map<String, dynamic> json) =>
    PublicInterestStats(
      alexaRank: json['alexa_rank'] as int,
      bingMatches: json['bing_matches'],
    );

Map<String, dynamic> _$PublicInterestStatsToJson(
        PublicInterestStats instance) =>
    <String, dynamic>{
      'alexa_rank': instance.alexaRank,
      'bing_matches': instance.bingMatches,
    };
