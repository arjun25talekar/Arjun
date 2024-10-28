import 'package:flutter/material.dart';
import 'package:flutter_assessment/data/CarData.dart';
import 'package:flutter_assessment/providers/currenct_provider.dart';
import 'package:flutter_assessment/utils/CommonTextStyles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/hive_provider.dart';
import '../../router/route_names.dart';
import '../../styles/common_styles.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Results1?>?> list = ref.watch(carDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
      ),
      body: list.when(data: (data) {
        return Container(
          color: Colors.green,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    ref.read(repoProvider).addCarDataToHive(data![index]!);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => DetailScreen()));
                    context.push("${RouteNames.detail.path()}");
                  },
                  child: Center(
                    child: Container(
                      decoration: widgetDecoration(Colors.white60),
                      child: Column(
                        children: [
                          Text(
                            "${data?[index]?.Mfr_CommonName}",
                            style: AppTextStyle.blackBold18,
                          ),
                          Text(
                            "${data?[index]?.Country}",
                            style: AppTextStyle.blackRegular14,
                          ),
                          Text(
                            "${data?[index]?.Mfr_ID}",
                            style: AppTextStyle.blackBold12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: data?.length,
          ),
        );
      }, error: (error, str) {
        Text("Error");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
