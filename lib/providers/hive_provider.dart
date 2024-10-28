import 'dart:developer';

import 'package:flutter_assessment/data/CarData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class HiveRepo {
  final carBoxName = "carBox";

  void RegisterAdapter() {
    Hive.registerAdapter(Results1Adapter());
    Hive.registerAdapter(vehicleTypesAdapter());
  }

  Future addCarDataToHive(Results1 data) async {
    log("!!!%%%%%%%%${data.Mfr_CommonName}");
    final box = await Hive.openBox<Results1>(carBoxName);
    if (box.isOpen) {
      await box.put(data.Mfr_ID, data);
      //Hive.close();
    } else {
      throw Exception("Box is Not Open");
    }
  }

  Future<List<Results1>> getAllCarsFromHive() async {
    final box = await Hive.openBox<Results1>(carBoxName);
    if (box.isOpen) {
      return box.values.toList();
    } else {
      throw Exception("Box is Not Open");
    }
  }
}

final repoProvider = Provider<HiveRepo>((ref) => HiveRepo());
