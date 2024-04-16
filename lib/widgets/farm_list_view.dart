import 'package:bookmyplace/utils/data/farm_data.dart';
import 'package:bookmyplace/widgets/farm_item.dart';
import 'package:flutter/material.dart';

class FarmListView extends StatelessWidget {

  List<dynamic> data;
   FarmListView({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return FarmItem(farm: data[index]);
      },
    );
  }
}
