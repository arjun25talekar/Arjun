import 'package:flutter/material.dart';
import 'package:flutter_assessment/data/CarData.dart';
import 'package:flutter_assessment/providers/hive_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  List<Results1> list = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(repoProvider).getAllCarsFromHive().then((value) {
        setState(() {
          list = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: Text(
                  "${list[index].Mfr_CommonName}",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text(
                  "${list[index].Mfr_Name}",
                ));
          }),
    );
  }
}
