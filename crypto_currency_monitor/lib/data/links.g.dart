// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      homepage:
          (json['homepage'] as List<dynamic>).map((e) => e as String).toList(),
      blockchainSite: (json['blockchain_site'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      officialForumUrl: (json['official_forum_url'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      chatUrl:
          (json['chat_url'] as List<dynamic>).map((e) => e as String).toList(),
      announcementUrl: (json['announcement_url'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      twitterScreenName: json['twitter_screen_name'] as String,
      facebookUsername: json['facebook_username'] as String,
      bitcointalkThreadIdentifier: json['bitcointalk_thread_identifier'],
      telegramChannelIdentifier: json['telegram_channel_identifier'] as String,
      subredditUrl: json['subreddit_url'] as String,
      reposUrl: ReposUrl.fromJson(json['repos_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'blockchain_site': instance.blockchainSite,
      'official_forum_url': instance.officialForumUrl,
      'chat_url': instance.chatUrl,
      'announcement_url': instance.announcementUrl,
      'twitter_screen_name': instance.twitterScreenName,
      'facebook_username': instance.facebookUsername,
      'bitcointalk_thread_identifier': instance.bitcointalkThreadIdentifier,
      'telegram_channel_identifier': instance.telegramChannelIdentifier,
      'subreddit_url': instance.subredditUrl,
      'repos_url': instance.reposUrl,
    };
