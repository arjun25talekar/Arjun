// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Results1Adapter extends TypeAdapter<Results1> {
  @override
  final int typeId = 0;

  @override
  Results1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results1(
      Country: fields[0] as String?,
      Mfr_CommonName: fields[1] as String?,
      Mfr_ID: fields[2] as int?,
      Mfr_Name: fields[3] as String?,
      VehicleTypes: (fields[4] as List?)?.cast<vehicleTypes>(),
    );
  }

  @override
  void write(BinaryWriter writer, Results1 obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.Country)
      ..writeByte(1)
      ..write(obj.Mfr_CommonName)
      ..writeByte(2)
      ..write(obj.Mfr_ID)
      ..writeByte(3)
      ..write(obj.Mfr_Name)
      ..writeByte(4)
      ..write(obj.VehicleTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Results1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class vehicleTypesAdapter extends TypeAdapter<vehicleTypes> {
  @override
  final int typeId = 1;

  @override
  vehicleTypes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return vehicleTypes(
      isPrimary: fields[5] as bool?,
      Name: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, vehicleTypes obj) {
    writer
      ..writeByte(2)
      ..writeByte(5)
      ..write(obj.isPrimary)
      ..writeByte(6)
      ..write(obj.Name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is vehicleTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarData _$CarDataFromJson(Map<String, dynamic> json) => CarData(
      Count: json['Count'] as int?,
      Message: json['Message'] as String?,
      Results: (json['Results'] as List<dynamic>?)
          ?.map((e) => Results1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarDataToJson(CarData instance) => <String, dynamic>{
      'Count': instance.Count,
      'Message': instance.Message,
      'Results': instance.Results,
    };

Results1 _$Results1FromJson(Map<String, dynamic> json) => Results1(
      Country: json['Country'] as String?,
      Mfr_CommonName: json['Mfr_CommonName'] as String?,
      Mfr_ID: json['Mfr_ID'] as int?,
      Mfr_Name: json['Mfr_Name'] as String?,
      VehicleTypes: (json['VehicleTypes'] as List<dynamic>?)
          ?.map((e) => vehicleTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Results1ToJson(Results1 instance) => <String, dynamic>{
      'Country': instance.Country,
      'Mfr_CommonName': instance.Mfr_CommonName,
      'Mfr_ID': instance.Mfr_ID,
      'Mfr_Name': instance.Mfr_Name,
      'VehicleTypes': instance.VehicleTypes,
    };

vehicleTypes _$vehicleTypesFromJson(Map<String, dynamic> json) => vehicleTypes(
      isPrimary: json['isPrimary'] as bool?,
      Name: json['Name'] as String?,
    );

Map<String, dynamic> _$vehicleTypesToJson(vehicleTypes instance) =>
    <String, dynamic>{
      'isPrimary': instance.isPrimary,
      'Name': instance.Name,
    };
