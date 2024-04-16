import 'package:bookmyplace/model/farm.dart';
import 'package:flutter/material.dart';

class FarmItem extends StatelessWidget {
  final Farm farm;

  FarmItem({required this.farm});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    print(height);
    print(width);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 260,
      height: height * 0.35,
      child: Stack(
        children: [
          Container(
            height: height * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:
                    DecorationImage(image: NetworkImage(farm.photos![0].url!), scale: 1,fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 125,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      farm.name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            _buildStarRating(4),
                            SizedBox(width: 5),
                            Text(
                              '4', // Display rating value
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '(${farm.reviews} Reviews) ',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${farm.price}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'Booking Available: ${farm.bookingAvailable ? 'Yes' : 'No'}',
                        //   style: TextStyle(color: Colors.white),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
    starWidgets.add(Icon(
      Icons.star,
      size: 18,
      color: Colors.yellow,
      weight: 4,
    ));
  }

  // Add empty stars
  for (int i = filledStars; i < totalStars; i++) {
    starWidgets.add(Icon(
      Icons.star,
      size: 18,
      color: Colors.grey.shade300,
      weight: 0.1,
    ));
  }

  return Row(children: starWidgets);
}
