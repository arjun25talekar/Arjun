import 'package:flutter/material.dart';
import 'package:flutter_assessment/providers/hive_provider.dart';
import 'package:flutter_assessment/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  HiveRepo().RegisterAdapter();
  runApp(const ProviderScope(child: AssessmentApp()));
}

class AssessmentApp extends ConsumerStatefulWidget {
  const AssessmentApp({super.key});

  @override
  ConsumerState<AssessmentApp> createState() => _AssessmentAppState();
}

class _AssessmentAppState extends ConsumerState<AssessmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
