import 'package:bookmyplace/model/farm.dart';
import 'package:bookmyplace/utils/data/farm_data.dart';
import 'package:bookmyplace/widgets/hotel_tile.dart';
import 'package:flutter/material.dart';

class HoteListView extends StatelessWidget {
  List<dynamic> data;
  HoteListView({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return HotelTile(farm: data[index]);
      },
    );
  }
}
