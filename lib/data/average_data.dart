import 'package:calculatorgradeaverage/model/lessons.dart';
import 'package:flutter/material.dart';

class DataHelper{


  static calculateAverage(){

    double toplamNot=0;
    double toplamKredi=0;

    allAddLessons.forEach((element) {

      toplamNot = toplamNot + (element.creditValue * element.letterValue);
      toplamKredi +=element.creditValue;
    });

    return toplamNot/toplamKredi;

  }


  static List<Lesson> allAddLessons = [];

  static addLesson(Lesson lesson){
    allAddLessons.add(lesson);
  }

  static List<String> _allLessonsLetters(){

    return ['AA','BA','BB','CB','CC','DC','DD','FD','FF'];

  }

  static List<int> _allCredits(){
    return List.generate(10, (index) => index+1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits(){

    return _allCredits().map((e) => DropdownMenuItem(child: Text(e.toString()),
    value: e.toDouble(),
    )).toList();
  }


  static  double _lettersConvertNote(String letter){

    switch(letter){
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'FD':
        return 1;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }
  static  List<DropdownMenuItem<double>> allLessonsLetter(){

    return _allLessonsLetters().map((e) =>  DropdownMenuItem(child: Text(e),value: _lettersConvertNote(e),),).toList();
  }
}