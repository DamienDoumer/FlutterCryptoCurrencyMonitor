
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'date.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Date {
    DateTime eth;
    DateTime eur;
    DateTime gbp;
    DateTime usd;

    Date({
        required this.eth,
        required this.eur,
        required this.gbp,
        required this.usd,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$DateToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Date fromJson(Map<String, dynamic> map){
    return _$DateFromJson(map);
  }

}
