
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
    String? id;
    String? symbol;
    String? name;
    dynamic? assetPlatformId;
    // Platforms? platforms;
    // DetailPlatforms? detailPlatforms;
    // int? blockTimeInMinutes;
    // String? hashingAlgorithm;
    // List<String>? categories;
    // dynamic? publicNotice;
    // List<dynamic>? additionalNotices;
    Tion? localization;
    Tion? description;
    // Links? links;
    Image? image;
    // String? countryOrigin;
    // DateTime? genesisDate;
    // double? sentimentVotesUpPercentage;
    // double? sentimentVotesDownPercentage;
    // int? watchlistPortfolioUsers;
    // int? marketCapRank;
    // int? coingeckoRank;
    // double? coingeckoScore;
    // double? developerScore;
    // double? communityScore;
    // double? liquidityScore;
    // double? publicInterestScore;
    // MarketData? marketData;
    // PublicInterestStats? publicInterestStats;
    // List<dynamic>? statusUpdates;
    // DateTime? lastUpdated;

    DetailedCryptoCurrency({
        this.id,
        this.symbol,
        this.name,
        this.assetPlatformId,
        // this.platforms,
        // this.detailPlatforms,
        // this.blockTimeInMinutes,
        // this.hashingAlgorithm,
        // this.categories,
        // this.publicNotice,
        // this.additionalNotices,
        this.localization,
        this.description,
        // this.links,
        this.image,
        // this.countryOrigin,
        // this.genesisDate,
        // this.sentimentVotesUpPercentage,
        // this.sentimentVotesDownPercentage,
        // this.watchlistPortfolioUsers,
        // this.marketCapRank,
        // this.coingeckoRank,
        // this.coingeckoScore,
        // this.developerScore,
        // this.communityScore,
        // this.liquidityScore,
        // this.publicInterestScore,
        // this.marketData,
        // this.publicInterestStats,
        // this.statusUpdates,
        // this.lastUpdated,
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
