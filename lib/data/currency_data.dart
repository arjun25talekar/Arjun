import 'package:json_annotation/json_annotation.dart';

part 'currency_data.g.dart';

@JsonSerializable()
class CurrencyData {
  final Map<String, dynamic> data;

  CurrencyData(this.data);

  factory CurrencyData.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDataFromJson(json);
}
