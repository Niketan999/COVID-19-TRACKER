import 'package:sliverappbar/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List CountryData;

  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      CountryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions:<Widget>[
          IconButton(icon: Icon(Icons.search),onPressed:(){
            showSearch(context: context, delegate: Search(CountryData));
          },)
        ],


        title: Text(
          'Country Statistics',
        ),
      ),
      body: //
      CountryData == null?Center(child: CircularProgressIndicator(),):
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
                      Text(CountryData[index]['country'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Image.network(
                          CountryData[index]['countryInfo']['flag'],
                          height: 50,
                          width: 60),
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
                                  CountryData[index]['cases'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 15,
                              )),
                          Text(
                              'ACTIVE:' +
                                  CountryData[index]['active'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          Text(
                              'RECOVERED:' +
                                  CountryData[index]['cases'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 15,
                              )),
                          Text(
                              'DEATHS:' +
                                  CountryData[index]['cases'].toString(),
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
        itemCount: CountryData == null ? 0 : CountryData.length,
        /**/

      ),
    );

  }
}
