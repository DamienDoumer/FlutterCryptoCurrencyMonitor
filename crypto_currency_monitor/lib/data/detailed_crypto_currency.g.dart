// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_crypto_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedCryptoCurrency _$DetailedCryptoCurrencyFromJson(
        Map<String, dynamic> json) =>
    DetailedCryptoCurrency(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      assetPlatformId: json['asset_platform_id'],
      platforms: Platforms.fromJson(json['platforms'] as Map<String?, dynamic>),
      // detailPlatforms: DetailPlatforms.fromJson(
      //     json['detail_platforms'] as Map<String, dynamic>),
      blockTimeInMinutes: json['block_time_in_minutes'] as int,
      hashingAlgorithm: json['hashing_algorithm'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publicNotice: json['public_notice'],
      additionalNotices: json['additional_notices'] as List<dynamic>,
      localization: Tion.fromJson(json['localization'] as Map<String, dynamic>),
      description: Tion.fromJson(json['description'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
      countryOrigin: json['country_origin'] as String,
      genesisDate: DateTime.parse(json['genesis_date'] as String),
      sentimentVotesUpPercentage:
          (json['sentiment_votes_up_percentage'] as num).toDouble(),
      sentimentVotesDownPercentage:
          (json['sentiment_votes_down_percentage'] as num).toDouble(),
      watchlistPortfolioUsers: json['watchlist_portfolio_users'] as int,
      marketCapRank: json['market_cap_rank'] as int,
      coingeckoRank: json['coingecko_rank'] as int,
      coingeckoScore: (json['coingecko_score'] as num).toDouble(),
      developerScore: (json['developer_score'] as num).toDouble(),
      communityScore: (json['community_score'] as num).toDouble(),
      liquidityScore: (json['liquidity_score'] as num).toDouble(),
      publicInterestScore: (json['public_interest_score'] as num).toDouble(),
      // marketData:
      //     MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
      publicInterestStats: PublicInterestStats.fromJson(
          json['public_interest_stats'] as Map<String, dynamic>),
      statusUpdates: json['status_updates'] as List<dynamic>,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$DetailedCryptoCurrencyToJson(
        DetailedCryptoCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'asset_platform_id': instance.assetPlatformId,
      'platforms': instance.platforms,
      'detail_platforms': instance.detailPlatforms,
      'block_time_in_minutes': instance.blockTimeInMinutes,
      'hashing_algorithm': instance.hashingAlgorithm,
      'categories': instance.categories,
      'public_notice': instance.publicNotice,
      'additional_notices': instance.additionalNotices,
      'localization': instance.localization,
      'description': instance.description,
      'links': instance.links,
      'image': instance.image,
      'country_origin': instance.countryOrigin,
      'genesis_date': instance.genesisDate == null ? '' : instance.genesisDate!.toIso8601String(),
      'sentiment_votes_up_percentage': instance.sentimentVotesUpPercentage,
      'sentiment_votes_down_percentage': instance.sentimentVotesDownPercentage,
      'watchlist_portfolio_users': instance.watchlistPortfolioUsers,
      'market_cap_rank': instance.marketCapRank,
      'coingecko_rank': instance.coingeckoRank,
      'coingecko_score': instance.coingeckoScore,
      'developer_score': instance.developerScore,
      'community_score': instance.communityScore,
      'liquidity_score': instance.liquidityScore,
      'public_interest_score': instance.publicInterestScore,
      'market_data': instance.marketData,
      'public_interest_stats': instance.publicInterestStats,
      'status_updates': instance.statusUpdates,
      'last_updated': instance.lastUpdated == null ? '' : instance.lastUpdated!.toIso8601String(),
    };
