import 'package:flutter/material.dart';
import 'package:yelp/data/local/hive_flutter.dart'; // Import HiveHelper class

class YelpFavoriteScreen extends StatelessWidget {
  const YelpFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // App bar code...
          ),
      body: FutureBuilder<List<String>>(
        future: HiveHelper.getSavedBusinesses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data!.isEmpty) {
            return const Center(child: Text('No saved businesses'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final businessName = snapshot.data![index];
                return ListTile(
                  title: Text(businessName),
                  // Additional UI customization as needed...
                );
              },
            );
          }
        },
      ),
    );
  }
}
