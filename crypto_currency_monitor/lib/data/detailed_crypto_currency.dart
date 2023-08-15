
import 'dart:convert';

import 'package:crypto_currency_monitor/data/detail_platform.dart';
import 'package:crypto_currency_monitor/data/image.dart';
import 'package:crypto_currency_monitor/data/market_data.dart';
import 'package:crypto_currency_monitor/data/platforms.dart';
import 'package:crypto_currency_monitor/data/public_interest_stats.dart';
import 'package:crypto_currency_monitor/data/tion.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
part 'detailed_crypto_currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailedCryptoCurrency {
    String id;
    String symbol;
    String name;
    dynamic assetPlatformId;
    Platforms platforms;
    DetailPlatforms detailPlatforms;
    int blockTimeInMinutes;
    String hashingAlgorithm;
    List<String> categories;
    dynamic publicNotice;
    List<dynamic> additionalNotices;
    Tion localization;
    Tion description;
    Links links;
    Image image;
    String countryOrigin;
    DateTime genesisDate;
    double sentimentVotesUpPercentage;
    double sentimentVotesDownPercentage;
    int watchlistPortfolioUsers;
    int marketCapRank;
    int coingeckoRank;
    double coingeckoScore;
    double developerScore;
    double communityScore;
    double liquidityScore;
    double publicInterestScore;
    MarketData marketData;
    PublicInterestStats publicInterestStats;
    List<dynamic> statusUpdates;
    DateTime lastUpdated;

    DetailedCryptoCurrency({
        required this.id,
        required this.symbol,
        required this.name,
        required this.assetPlatformId,
        required this.platforms,
        required this.detailPlatforms,
        required this.blockTimeInMinutes,
        required this.hashingAlgorithm,
        required this.categories,
        required this.publicNotice,
        required this.additionalNotices,
        required this.localization,
        required this.description,
        required this.links,
        required this.image,
        required this.countryOrigin,
        required this.genesisDate,
        required this.sentimentVotesUpPercentage,
        required this.sentimentVotesDownPercentage,
        required this.watchlistPortfolioUsers,
        required this.marketCapRank,
        required this.coingeckoRank,
        required this.coingeckoScore,
        required this.developerScore,
        required this.communityScore,
        required this.liquidityScore,
        required this.publicInterestScore,
        required this.marketData,
        required this.publicInterestStats,
        required this.statusUpdates,
        required this.lastUpdated,
    });
    
  String toJson() {
    Map<String, dynamic> curMap = _$DetailedCryptoCurrencyToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  DetailedCryptoCurrency fromJson(Map<String, dynamic> map){
    return _$DetailedCryptoCurrencyFromJson(map);
  }

}
