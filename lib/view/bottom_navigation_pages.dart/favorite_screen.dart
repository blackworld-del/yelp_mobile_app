import 'package:flutter/material.dart';
import 'package:yelp/data/local/hive_flutter.dart';

class YelpFavoriteScreen extends StatefulWidget {
  const YelpFavoriteScreen({Key? key}) : super(key: key);

  @override
  _YelpFavoriteScreenState createState() => _YelpFavoriteScreenState();
}

class _YelpFavoriteScreenState extends State<YelpFavoriteScreen> {
  late Future<List<String>> _savedBusinesses;

  @override
  void initState() {
    super.initState();
    _savedBusinesses = HiveHelper.getSavedBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: _savedBusinesses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<String> savedBusinesses = snapshot.data!;
            return ListView.builder(
              itemCount: savedBusinesses.length,
              itemBuilder: (context, index) {
                final businessName = savedBusinesses[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(
                      businessName,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    // tileColor: Colors.black,
                    shape: Border.all(color: Colors.grey),
                    // Add other UI components as needed
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
