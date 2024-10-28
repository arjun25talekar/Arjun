// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UniversitiesData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversitiesData _$UniversitiesDataFromJson(Map<String, dynamic> json) =>
    UniversitiesData(
      json['country'] as String,
      (json['domains'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UniversitiesDataToJson(UniversitiesData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'domains': instance.domains,
    };
