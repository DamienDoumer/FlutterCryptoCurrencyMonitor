// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReposUrl _$ReposUrlFromJson(Map<String, dynamic> json) => ReposUrl(
      github:
          (json['github'] as List<dynamic>).map((e) => e as String).toList(),
      bitbucket: json['bitbucket'] as List<dynamic>,
    );

Map<String, dynamic> _$ReposUrlToJson(ReposUrl instance) => <String, dynamic>{
      'github': instance.github,
      'bitbucket': instance.bitbucket,
    };
