// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yelp/constant/colors.dart';
import 'business_screen.dart'; // Needed to load JSON file

class YelpAllCategoriesScreen extends StatelessWidget {
  final List<String> categories;

  const YelpAllCategoriesScreen({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'All Categories',
          style: TextStyle(
            color: YelpColors.backGroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryCard(context, categories[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BusinessListScreen(category: category),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category_rounded,
                  color: YelpColors.backGroundColor,
                ),
                const SizedBox(height: 8),
                Text(
                  category,
                  style: TextStyle(
                    color: YelpColors.backGroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
