import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CarData.g.dart';

@JsonSerializable()
class CarData {
  int? Count;
  String? Message;
  final List<Results1>? Results;

  CarData({this.Count, this.Message, this.Results});

  factory CarData.fromJson(Map<String, dynamic> json) =>
      _$CarDataFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 0)
class Results1 {
  @HiveField(0)
  String? Country;
  @HiveField(1)
  String? Mfr_CommonName;
  @HiveField(2)
  int? Mfr_ID;
  @HiveField(3)
  String? Mfr_Name;
  @HiveField(4)
  List<vehicleTypes>? VehicleTypes;

  Results1(
      {this.Country,
      this.Mfr_CommonName,
      this.Mfr_ID,
      this.Mfr_Name,
      this.VehicleTypes});

  factory Results1.fromJson(Map<String, dynamic> json) =>
      _$Results1FromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 01)
class vehicleTypes {
  @HiveField(5)
  bool? isPrimary;
  @HiveField(6)
  String? Name;

  vehicleTypes({this.isPrimary, this.Name});

  factory vehicleTypes.fromJson(Map<String, dynamic> json) =>
      _$vehicleTypesFromJson(json);
}
