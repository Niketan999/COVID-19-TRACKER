import 'package:flutter/material.dart';
import 'package:sliverappbar/panels/datasource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliverappbar/pages/faqs.dart';
class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQpanel()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: Colors.red[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('FAQs',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.pmcares.gov.in/en/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: Colors.red[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.arrow_forward,color: Colors.white,),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: Colors.red[500],

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MYTH BUSTERS',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
