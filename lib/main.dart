import 'package:flutter/material.dart';
import 'package:yelp/data/local/yelp_lcoal.dart';
import 'package:yelp/view/start/start_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await YelpLocalData.sharedInit();
  runApp(
    const Yelp(),
  );
}

class Yelp extends StatelessWidget {
  const Yelp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: const YelpStartedScreen(),
    );
  }
}
