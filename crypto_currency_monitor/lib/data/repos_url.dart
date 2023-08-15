
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'repos_url.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReposUrl {
    List<String> github;
    List<dynamic> bitbucket;

    ReposUrl({
        required this.github,
        required this.bitbucket,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$ReposUrlToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static ReposUrl fromJson(Map<String, dynamic> map){
    return _$ReposUrlFromJson(map);
  }

}
