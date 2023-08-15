
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'public_interest_stats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PublicInterestStats {
    int alexaRank;
    dynamic bingMatches;

    PublicInterestStats({
        required this.alexaRank,
        required this.bingMatches,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$PublicInterestStatsToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static PublicInterestStats fromJson(Map<String, dynamic> map){
    return _$PublicInterestStatsFromJson(map);
  }

}
