// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCurrency _$CryptoCurrencyFromJson(Map<String, dynamic> json) =>
    CryptoCurrency(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      currentPrice: json['current_price'] as num?,
      marketCap: json['market_cap'] as num?,
      marketCapRank: json['market_cap_rank'] as num?,
      fullyDilutedValuation: json['fully_diluted_valuation'] as num?,
      totalVolume: json['total_volume'] as num?,
      high24h: json['high24h'] as num?,
      low24h: json['low24h'] as num?,
      priceChange24h: (json['price_change24h'] as num?)?.toDouble(),
      priceChangePercentage24h:
          (json['price_change_percentage24h'] as num?)?.toDouble(),
      marketCapChange24h: (json['market_cap_change24h'] as num?)?.toDouble(),
      marketCapChangePercentage24h:
          (json['market_cap_change_percentage24h'] as num?)?.toDouble(),
      circulatingSupply: json['circulating_supply'] as double?,
      totalSupply: json['total_supply'] as double?,
      maxSupply: json['max_supply'] as double?,
      ath: json['ath'] as num?,
      athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
      athDate: json['ath_date'] as String?,
      atl: (json['atl'] as num?)?.toDouble(),
      atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
      atlDate: json['atl_date'] as String?,
      lastUpdated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$CryptoCurrencyToJson(CryptoCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'price_change24h': instance.priceChange24h,
      'price_change_percentage24h': instance.priceChangePercentage24h,
      'market_cap_change24h': instance.marketCapChange24h,
      'market_cap_change_percentage24h': instance.marketCapChangePercentage24h,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'ath_change_percentage': instance.athChangePercentage,
      'ath_date': instance.athDate,
      'atl': instance.atl,
      'atl_change_percentage': instance.atlChangePercentage,
      'atl_date': instance.atlDate,
      'last_updated': instance.lastUpdated,
    };
