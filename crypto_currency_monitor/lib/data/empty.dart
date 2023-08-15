
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'empty.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Empty {
    dynamic decimalPlace;
    String contractAddress;

    Empty({
        required this.decimalPlace,
        required this.contractAddress,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$EmptyToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Empty fromJson(Map<String, dynamic> map){
    return _$EmptyFromJson(map);
  }

}
