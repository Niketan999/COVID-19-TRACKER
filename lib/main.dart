import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliverappbar/homepage.dart';
import 'package:sliverappbar/panels/datasource.dart';
import 'package:sliverappbar/webview.dart' ;
import 'package:sliverappbar/pages/Prevention.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:sliverappbar/pages/statePage.dart';

void main() {
  runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyTabs()

  ));
}



class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(
            title: new Center(child: new Text("COVID - 19  TRACKER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,fontFamily: 'GrenzeGotisch'),)),

            backgroundColor: Colors.red[900],
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(child:Text("Analysis",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),icon: new Icon(Icons.insert_chart,size: 30.0,)),
                  new Tab(child:Text("Statistics",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),icon: new Icon(Icons.add_location,size: 30.0,)),
                  new Tab(child:Text("Centers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),icon: new Icon(Icons.local_hospital,size: 30.0,)),
                ]
            )
        ),

        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              HomePage(),
              Webview(),
              HomeScreen(),

            ]
        )
    );
  }
}