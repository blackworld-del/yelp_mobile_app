import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:yelp/constant/colors.dart';

import 'business_details.dart';
import 'locations.dart'; // Import your color constants

class BusinessListScreen extends StatelessWidget {
  final String category;
  final int? minReviewCount; // Add review count filter parameter

  const BusinessListScreen(
      {Key? key, required this.category, this.minReviewCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: YelpColors.backGroundColor.withOpacity(0.4),
        ),
        title: Text(
          category,
          style: TextStyle(
            color: YelpColors.backGroundColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: _fetchBusinesses(
            category, minReviewCount), // Pass review count filter
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: YelpColors.backGroundColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(
                  color: YelpColors.backGroundColor,
                ),
              ),
            );
          } else {
            final businesses = snapshot.data!;
            return ListView.builder(
              itemCount: businesses.length,
              itemBuilder: (context, index) {
                // Extract business details
                String name = businesses[index]['name'];
                int reviewCount = businesses[index]['review_count'];
                bool isOpen = businesses[index]['is_open'] == 1;
                double stars = businesses[index]['stars']
                    .toDouble(); // Convert int to double

                return Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: YelpColors.backGroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: stars,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.zero,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (_) {},
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$stars',
                              style: TextStyle(
                                color: YelpColors.backGroundColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Text(
                        //   'Open: ${isOpen ? 'Yes' : 'No'}',
                        //   style: TextStyle(
                        //     color: isOpen ? Colors.green : Colors.red,
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Implement save button functionality
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BusinessLocationMapScreen(
                                      latitude: businesses[index]['latitude'],
                                      longitude: businesses[index]['longitude'],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                              ),
                              child: const Text(
                                'Check Location',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      // Handle tap on business item
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessDetailsScreen(
                            business: businesses[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchBusinesses(
      String category, int? minReviewCount) async {
    try {
      // Construct query URL with review count filter if provided
      final queryUrl = minReviewCount != null
          ? 'http://10.135.16.18:3000/search?category=$category&minReviewCount=$minReviewCount'
          : 'http://10.135.16.18:3000/search?category=$category';

      final response = await http.get(Uri.parse(queryUrl));
      if (response.statusCode == 200) {
        final List<dynamic> businesses = json.decode(response.body);
        return List<Map<String, dynamic>>.from(businesses);
      } else {
        throw Exception('Failed to load businesses');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load businesses');
    }
  }
}
