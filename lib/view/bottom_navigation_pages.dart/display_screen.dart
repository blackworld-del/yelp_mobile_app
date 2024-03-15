import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yelp/constant/colors.dart';

import '../../network provider/yelp_api.dart';

class YelpDisplayScreen extends StatefulWidget {
  const YelpDisplayScreen({Key? key}) : super(key: key);

  @override
  State<YelpDisplayScreen> createState() => _YelpDisplayScreenState();
}

class _YelpDisplayScreenState extends State<YelpDisplayScreen> {
  late Future<List<Map<String, dynamic>>> _test;

  @override
  void initState() {
    _test = BusinessService.fetchFirst5Businesses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _test,
          builder: (context, snapshot) {
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
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              final List<Map<String, dynamic>> businesses = snapshot.data!;
              return ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (context, index) {
                  final business = businesses[index];
                  print(business);
                  return ListTile(
                    title: Text(business['name'] ?? 'No Name'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
