import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WorldWidePanel extends StatelessWidget {
  final Map  Worlddata;


  const WorldWidePanel({Key key, this.Worlddata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3.2,
        child:GridView(


            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio: 2),
            children:<Widget>[


              StatusPanel(

                title:'CONFIRMED',
                panelColor:Colors.red[600],
                textColor:Colors.white,
                count:Worlddata['cases'].toString(),

              ),
              StatusPanel(
                title:'ACTIVE',
                panelColor:Colors.purple[600],
                textColor:Colors.white,
                count:Worlddata['active'].toString(),
              ),
              StatusPanel(
                title:'RECOVERED',
                panelColor:Colors.teal[600],
                textColor:Colors.white,
                count:Worlddata['recovered'].toString(),
              ),
              StatusPanel(
                title:'DEATHS',
                panelColor:Colors.orange[600],
                textColor:Colors.white,
                count:Worlddata['deaths'].toString(),
              ),
            ]

        )
    );
  }
}

  /*BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border(
        left :BorderSide(
            color:Colors.red[300],
            width:15.0
        ),
        top:BorderSide (
            color:Colors.red[500],
            width:10.0
        ),
        right:BorderSide (
            color:Colors.red[700],
            width:5.0
        ),
        bottom:BorderSide (
            color:Colors.red[900],
            width:3.0
        )
    ),
  );
}*/
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  final Decoration decoration;


  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count,this.decoration }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Container(
      margin:EdgeInsets.all(10),

      height:100,width: width/2,
      decoration: BoxDecoration(
        color:panelColor,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [

          BoxShadow(
            color: Colors.grey[500],
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              10.0, // Move to right 10  horizontally
              10.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white),),
          Text(count,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white)),
        ],
      ),
    );
  }
}

