import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        primaryColor:Color(0xfff5435d)
        ,
      ),
      home: AwesomeCarousel(),
    );
  }
}
