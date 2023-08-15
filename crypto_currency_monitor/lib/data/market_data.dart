
import 'dart:convert';

import 'package:crypto_currency_monitor/data/date.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MarketData {
    Map<String, double> currentPrice;
    dynamic totalValueLocked;
    dynamic mcapToTvlRatio;
    dynamic fdvToTvlRatio;
    dynamic roi;
    Map<String, double> ath;
    Date athDate;
    Map<String, double> atl;
    Date atlDate;
    Map<String, double> marketCap;
    int marketCapRank;
    Map<String, double> fullyDilutedValuation;
    Map<String, double> totalVolume;
    int totalSupply;
    int maxSupply;
    int circulatingSupply;
    DateTime lastUpdated;

    MarketData({
        required this.currentPrice,
        required this.totalValueLocked,
        required this.mcapToTvlRatio,
        required this.fdvToTvlRatio,
        required this.roi,
        required this.ath,
        required this.athDate,
        required this.atl,
        required this.atlDate,
        required this.marketCap,
        required this.marketCapRank,
        required this.fullyDilutedValuation,
        required this.totalVolume,
        required this.totalSupply,
        required this.maxSupply,
        required this.circulatingSupply,
        required this.lastUpdated,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$MarketDataToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static MarketData fromJson(Map<String, dynamic> map){
    return _$MarketDataFromJson(map);
  }

}
