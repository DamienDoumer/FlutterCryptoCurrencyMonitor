
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
    String thumb;
    String small;
    String large;

    Image({
        required this.thumb,
        required this.small,
        required this.large,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$ImageToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Image fromJson(Map<String, dynamic> map){
    return _$ImageFromJson(map);
  }

}
