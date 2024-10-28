import 'package:flutter_assessment/data/CarData.dart';
import 'package:flutter_assessment/data/UniversitiesData.dart';
import 'package:flutter_assessment/data/currency_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repo/repo.dart';

final currencyDataProvider = FutureProvider<CurrencyData?>((ref) async {
  return await ref.watch(currencyRepoProvider).getCurrencyData();
});

final universitiesProvider =
    FutureProvider<List<UniversitiesData?>?>((ref) async {
  return await ref.watch(currencyRepoProvider).getUniversities();
});

final carDataProvider = FutureProvider<List<Results1?>?>((ref) async {
  return await ref.watch(currencyRepoProvider).getCars();
});
