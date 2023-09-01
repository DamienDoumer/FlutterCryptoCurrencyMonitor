
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'platforms.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Platforms {
    String? empty;

    Platforms({
        required this.empty,
    });

  String toJson() {
    Map<String?, dynamic> curMap = _$PlatformsToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Platforms fromJson(Map<String?, dynamic> map){
    return _$PlatformsFromJson(map);
  }

}
