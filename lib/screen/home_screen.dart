import 'dart:convert';

import 'package:bookmyplace/model/farm.dart';
import 'package:bookmyplace/utils/data/farm_data.dart';
import 'package:bookmyplace/widgets/cateogry_chip_widget.dart';
import 'package:bookmyplace/widgets/farm_list_view.dart';
import 'package:bookmyplace/widgets/hotel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Farm> farms = [];

  @override
  void initState() {
    super.initState();
    fetchFarmList();
  }

  Future<List<Farm>> fetchFarmList() async {
  final response = await http.get(Uri.parse('https://pp-backend-cgpq.onrender.com/api/v1/pp/getall'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);

    print("DDDD");

    for (var item in jsonData) {
      Farm farm = Farm.fromJson(item);
      farms.add(farm);
      print("done");
    }

    return farms;
  } else {
    throw Exception('Failed to load farm list');
  }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    int _selectedIndex = 0;
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        excludeHeaderSemantics: true,
        title: Text(
          "Hello Andy,",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                size: 22,
                color: Colors.grey,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.018, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find your hotel",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: width * 0.76,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), // Circular border
                    ),
                    child: SearchBar(
                      hintText: "Search Hotel",
                      leading: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.sort),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Container(
                height: 10,
                child: CategoryChipSelection(),
              ),
              SizedBox(
                height: height * 0.06,
              ),

              Container(
                height: 300,
                child: FarmListView(data: farms),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Near You",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // Container(height: 200, child: HoteListView())

              HoteListView(data:farms)

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.hotel),
                label: 'List Hotel',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
