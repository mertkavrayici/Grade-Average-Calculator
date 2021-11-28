import 'package:calculatorgradeaverage/constants/constants.dart';
import 'package:calculatorgradeaverage/data/average_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonList extends StatelessWidget{

  final Function onDismiss;


  const LessonList({required this.onDismiss,Key? key}): super(key:key);


  @override
  Widget build(BuildContext context) {

    return DataHelper.allAddLessons.length > 0 ? ListView.builder(itemCount:DataHelper.allAddLessons.length ,itemBuilder: (context,index){

      return Dismissible(
        key: UniqueKey(),

        direction: DismissDirection.startToEnd,
          onDismissed: (a){

         onDismiss(index);

          },

          child : Padding(padding: const EdgeInsets.all(5.0),
            child: Card(

              child: ListTile(
                title: Text(DataHelper.allAddLessons[index].name),
                leading: CircleAvatar(
                  backgroundColor: Constants.primaryColor,
                  child: Text((DataHelper.allAddLessons[index].letterValue * DataHelper.allAddLessons[index].creditValue).toStringAsFixed(0),style:GoogleFonts.amethysta() ,),
                ),
                subtitle: Text('${DataHelper.allAddLessons[index].creditValue} Kredi, Not Değeri${DataHelper.allAddLessons[index].letterValue}'),
              ),
            ),

          ),
      );
    }): Container(
      child : Center(

      child: Text("Lütfen Ders Ekleyiniz!",textAlign: TextAlign.center,style: Constants.textStyle, ),
    )


    )

    ;


  }


}