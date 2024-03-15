import 'package:flutter/material.dart';
import 'package:yelp/view/bottom_navigation_pages.dart/display_screen.dart';
import 'package:yelp/view/bottom_navigation_pages.dart/favorite_screen.dart';
import 'package:yelp/view/bottom_navigation_pages.dart/search_screen.dart';
import 'package:yelp/view/bottom_navigation_pages.dart/settings_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constant/colors.dart';

class YelpHomeController extends StatefulWidget {
  const YelpHomeController({super.key});

  @override
  State<YelpHomeController> createState() => _YelpHomeControllerState();
}

class _YelpHomeControllerState extends State<YelpHomeController> {
  int index = 0;
  List<Widget> screens = [
    const YelpDisplayScreen(),
    const YelpSearchScreen(),
    const YelpFavoriteScreen(),
    const YelpSettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const YelpSettingsScreen();
                }));
              },
              icon: Icon(
                Icons.settings_outlined,
                color: YelpColors.backGroundColor,
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return const YelpSettingsScreen();
          //     }));
          //   },
          //   icon: Icon(
          //     Icons.refresh_rounded,
          //     color: YelpColors.backGroundColor,
          //   ),
          // ),
        ],
      ),
      body: screens[index],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
              "Home",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            selectedColor: Colors.blueGrey[800],
            unselectedColor: Colors.blueGrey[200],
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text(
              "Search",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            selectedColor: Colors.blueGrey[800],
            unselectedColor: Colors.blueGrey[200],
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text(
              "Likes",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            selectedColor: Colors.blueGrey[800],
            unselectedColor: Colors.blueGrey[200],
          ),

          /// Search
        ],
      ),
    );
  }
}
