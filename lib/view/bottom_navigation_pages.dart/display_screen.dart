import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yelp/constant/colors.dart';
import 'allCategories.dart';
import 'business_screen.dart'; // Needed to load JSON file

class YelpDisplayScreen extends StatelessWidget {
  const YelpDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: TextStyle(
            color: YelpColors.backGroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _loadCategories(context),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final categories = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      categories.length > 7 ? 7 : categories.length,
                      (index) => _buildCategoryCard(context, categories[index]),
                    ),
                  ),
                  if (categories.length >
                      7) // Show "See more" button if there are more than 7 categories
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              YelpAllCategoriesScreen(categories: categories),
                        ));
                      },
                      child: Text(
                        'See more',
                        style: TextStyle(
                          color: YelpColors.backGroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
        },
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

  Future<List<String>> _loadCategories(BuildContext context) async {
    final String response =
        await rootBundle.loadString('asstes/json/categories.json');
    final List<dynamic> data = json.decode(response)['categories'];
    return List<String>.from(data);
  }
}
