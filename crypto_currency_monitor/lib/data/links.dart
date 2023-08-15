
import 'dart:convert';

import 'package:crypto_currency_monitor/data/repos_url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Links {
    List<String> homepage;
    List<String> blockchainSite;
    List<String> officialForumUrl;
    List<String> chatUrl;
    List<String> announcementUrl;
    String twitterScreenName;
    String facebookUsername;
    dynamic bitcointalkThreadIdentifier;
    String telegramChannelIdentifier;
    String subredditUrl;
    ReposUrl reposUrl;

    Links({
        required this.homepage,
        required this.blockchainSite,
        required this.officialForumUrl,
        required this.chatUrl,
        required this.announcementUrl,
        required this.twitterScreenName,
        required this.facebookUsername,
        required this.bitcointalkThreadIdentifier,
        required this.telegramChannelIdentifier,
        required this.subredditUrl,
        required this.reposUrl,
    });

  String toJson() {
    Map<String, dynamic> curMap = _$LinksToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  static Links fromJson(Map<String, dynamic> map){
    return _$LinksFromJson(map);
  }

}
