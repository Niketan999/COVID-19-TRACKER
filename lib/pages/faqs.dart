import 'package:sliverappbar/panels/datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FAQpanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("               FAQ's",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),


      backgroundColor: Colors.red[900],),
      body:
      ListView.builder(itemCount:datasource.questionAnswers.length,itemBuilder: (context,index){

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(title: Text(datasource.questionAnswers[index]['question'],style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
            children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(datasource.questionAnswers[index]['answers'],style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
            ),
          ],),
        );
      }),
    );
  }
}
