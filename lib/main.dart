import 'package:calculatorgradeaverage/constants/constants.dart';
import 'package:flutter/material.dart';

import 'screens/calculate_average_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: " Not Ortalaması Hesaplama",

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Constants.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: CalculateAverageScreen(),
    );


  }
  
  
  
}
