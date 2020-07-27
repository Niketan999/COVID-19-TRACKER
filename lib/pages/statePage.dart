import 'package:sliverappbar/pages/search.dart';
import 'package:sliverappbar/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sliverappbar/pages/searchstate.dart';
class statewisePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<statewisePage> {
  List StateData;

  void fetchStateData() async{
    http.Response response =
    await http.get('https://api.covid19india.org/data.json');
    setState(() {
      Map<String, dynamic> map = json.decode(response.body);
      StateData  = map["statewise"];
    //  StateData = json.decode(response.body);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStateData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions:<Widget>[
        IconButton(icon: Icon(Icons.search),onPressed:(){
    showSearch(context: context, delegate: SearchState(StateData));
    },)
    ],
    title: Text(
    'Statewise Statistics',
    ),
    ),
      body: //
      StateData == null?Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[100],
                  blurRadius: 10,
                  offset: Offset(0, 10)),
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(StateData[index]['state'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),

                    ],
                  ),
                ),
                Expanded(
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'CONFIRMED:' +
                                  StateData[index]['confirmed'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 15,
                              )),
                          Text(
                              'ACTIVE:' +
                                  StateData[index]['active'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          Text(
                              'RECOVERED:' +
                                  StateData[index]['recovered'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 15,
                              )),
                          Text(
                              'DEATHS:' +
                                  StateData[index]['deaths'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ))

              ],
            ),);


        },
        itemCount: StateData == null ? 0 : StateData.length,
        /**/

      ),
    );
  }


}
