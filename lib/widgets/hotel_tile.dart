import 'package:bookmyplace/model/farm.dart';
import 'package:flutter/material.dart';

class HotelTile extends StatelessWidget {
  final Farm farm;

  HotelTile({required this.farm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(farm.photos![0].url!),fit: BoxFit.cover)
              ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        farm.name!,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 18),
                          SizedBox(width: 5),
                          Text(farm.name!,style: TextStyle(fontSize: 15),), 
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                          children: [
                             Row(
                          children: [
                            _buildStarRating(4),
                            SizedBox(width: 5),
                            Text(
                              '4', // Display rating value
                              style: TextStyle(color: Colors.yellow,fontSize: 14),
                            ),
                          ],
                        ),
                          ]
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '\$'+farm.price.toString(),
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                
                
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _buildStarRating(double rating) {
    int filledStars = rating.floor();
    int totalStars = 5;

    List<Widget> starWidgets = [];

    // Add filled stars
    for (int i = 0; i < filledStars; i++) {
      starWidgets.add(Icon(Icons.star,size: 18, color: Colors.yellow , weight: 4,));
    }

    // Add empty stars
    for (int i = filledStars; i < totalStars; i++) {
      starWidgets.add(Icon(Icons.star,size: 18, color: Colors.grey.shade300,weight: 0.1,));
    }

    return Row(children: starWidgets);
  }
