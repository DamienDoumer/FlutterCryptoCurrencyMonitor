
import 'dart:convert';

import 'package:crypto_currency_monitor/data/empty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_platform.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailPlatforms {
    Empty empty;

    DetailPlatforms({
        required this.empty,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$DetailPlatformsToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static DetailPlatforms fromJson(Map<String, dynamic> map){
    return _$DetailPlatformsFromJson(map);
  }

}
