// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketData _$MarketDataFromJson(Map<String, dynamic> json) => MarketData(
      currentPrice: (json['current_price'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalValueLocked: json['total_value_locked'],
      mcapToTvlRatio: json['mcap_to_tvl_ratio'],
      fdvToTvlRatio: json['fdv_to_tvl_ratio'],
      roi: json['roi'],
      ath: (json['ath'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      athDate: Date.fromJson(json['ath_date'] as Map<String, dynamic>),
      atl: (json['atl'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      atlDate: Date.fromJson(json['atl_date'] as Map<String, dynamic>),
      marketCap: (json['market_cap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      marketCapRank: json['market_cap_rank'] as int,
      fullyDilutedValuation:
          (json['fully_diluted_valuation'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalVolume: (json['total_volume'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalSupply: json['total_supply'] as int,
      maxSupply: json['max_supply'] as int,
      circulatingSupply: json['circulating_supply'] as int,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$MarketDataToJson(MarketData instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'total_value_locked': instance.totalValueLocked,
      'mcap_to_tvl_ratio': instance.mcapToTvlRatio,
      'fdv_to_tvl_ratio': instance.fdvToTvlRatio,
      'roi': instance.roi,
      'ath': instance.ath,
      'ath_date': instance.athDate,
      'atl': instance.atl,
      'atl_date': instance.atlDate,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'circulating_supply': instance.circulatingSupply,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
