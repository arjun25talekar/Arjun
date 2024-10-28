import 'dart:developer';

import 'package:flutter_assessment/data/CarData.dart';
import 'package:flutter_assessment/data/UniversitiesData.dart';
import 'package:flutter_assessment/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/currency_data.dart';
import '../network/dio_client.dart';

class Repo {
  final Ref ref;

  Repo(this.ref);

  Future<CurrencyData?> getCurrencyData() async {
    CurrencyData? currencyMap = null;
    final response = await ref.read(dioProvider).get(currencyAPIUrl);

    if (response.statusCode == 200) {
      currencyMap = CurrencyData.fromJson(response.data);
    } else {
      log("@@@@@ Error");
    }
    return currencyMap;
  }

  Future<List<UniversitiesData>?> getUniversities() async {
    List<UniversitiesData>? list = null;
    final response = await ref.read(dioProvider).get(universitiesUrl);

    if (response.statusCode == 200) {
      list = response.data
          .map<UniversitiesData>(
              (pokemon) => UniversitiesData.fromJson(pokemon))
          .toList();

      log("*****${list?[0].country}");

      return list;
    }
  }

  Future<List<Results1>?> getCars() async {
    List<Results1>? list = null;

    final response = await ref.read(dioProvider).get(
        "https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json");
    if (response.statusCode == 200) {
      list = response.data['Results']
          .map<Results1>((products) => Results1.fromJson(products))
          .toList();
      return list;
    }
  }
}

final currencyRepoProvider = Provider((ref) => Repo(ref));
