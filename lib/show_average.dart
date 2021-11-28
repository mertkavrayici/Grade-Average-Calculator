import 'package:calculatorgradeaverage/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget{

  final double average;
  final int lessonCount;



  const ShowAverage({required this.average,required this.lessonCount, Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? '$lessonCount Ders Girildi' : 'Lütfen Ders Seçiniz',
          style: Constants.lessonCountStyle,

        ),
        Text(
          average >=0 ? '${average.toStringAsFixed(2)}': '0.0',
          style: Constants.averageStyle,
        ),
        Text("Ortalama")
        
      ],
    );
  }
  
}