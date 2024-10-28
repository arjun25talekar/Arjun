import 'package:json_annotation/json_annotation.dart';

part 'UniversitiesData.g.dart';

@JsonSerializable()
class UniversitiesData {
  String country;
  List<String>? domains;

  UniversitiesData(this.country, this.domains);

  factory UniversitiesData.fromJson(Map<String, dynamic> json) =>
      _$UniversitiesDataFromJson(json);
}
