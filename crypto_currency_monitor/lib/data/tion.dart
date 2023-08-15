
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tion.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tion {
    String en;
    String fr;

    Tion({
        required this.en,
        required this.fr,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$TionToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Tion fromJson(Map<String, dynamic> map){
    return _$TionFromJson(map);
  }

}
