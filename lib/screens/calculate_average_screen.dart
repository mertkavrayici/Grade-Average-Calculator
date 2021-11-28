import 'package:calculatorgradeaverage/data/average_data.dart';
import 'package:calculatorgradeaverage/constants/constants.dart';
import 'package:calculatorgradeaverage/model/lessons.dart';
import 'package:calculatorgradeaverage/show_average.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateAverageScreen extends StatefulWidget {
  CalculateAverageScreen({Key? key}) : super(key: key);

  @override
  _CalculateAverageScreenState createState() => _CalculateAverageScreenState();
}

class _CalculateAverageScreenState extends State<CalculateAverageScreen> {
  var formKey = GlobalKey<FormState>();

  double secilen_deger = 4;
  double secilen_kredi = 1;
  String secilen_ders="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Text(
            Constants.headerText,
            style: Constants.textStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //form

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(average: DataHelper.calculateAverage(), lessonCount:DataHelper.allAddLessons.length),
                ),
              ],
            ),
            //list
            Expanded(
                child: Container(
              child: Text("Liste Buraya Gelecek"),
              color: Colors.blue,
            ))
          ],
        ));
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFromField(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _buildLetters(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _buildCredits(),
              ),
              IconButton(
                onPressed: _addLessons,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.primaryColor,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFromField() {
    return TextFormField(
      onSaved: (deger){

        setState(() {

          secilen_ders=deger!;
        });

      },
      validator: (s){
        if(s!.length <= 0){
          return 'Ders Adını Giriniz';

        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.primaryColor.shade100),
    );
  }

  _buildLetters() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Constants.primaryColor.shade100.withOpacity(0.3),
            borderRadius: Constants.borderRadius),
        child: DropdownButton<double>(
          value: secilen_deger,
          elevation: 16,
          iconEnabledColor: Constants.primaryColor.shade200,
          onChanged: (deger) {
            setState(() {
              secilen_deger = deger!;
            });
          },
          underline: Container(),
          items: DataHelper.allLessonsLetter(),
        ));
  }

  _buildCredits() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Constants.primaryColor.shade100.withOpacity(0.3),
            borderRadius: Constants.borderRadius),
        child: DropdownButton<double>(
          value: secilen_kredi,
          elevation: 16,
          iconEnabledColor: Constants.primaryColor.shade200,
          onChanged: (deger) {
            setState(() {
              secilen_kredi = deger!;
            });
          },
          underline: Container(),
          items: DataHelper.allCredits(),
        ));
  }

  void _addLessons() {

    if(formKey.currentState!.validate()){

      formKey.currentState!.save();
      var eklenecekDers =Lesson(name: secilen_ders, letterValue: secilen_deger, creditValue: secilen_kredi);

      DataHelper.addLesson(eklenecekDers);

      setState(() {


      });
    }
    else{

    }
  }
}
