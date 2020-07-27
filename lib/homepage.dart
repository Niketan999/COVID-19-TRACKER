import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:sliverappbar/pages/countryPage.dart';
import 'package:sliverappbar/pages/statePage.dart';
import 'package:sliverappbar/panels/infopanel.dart';
import 'package:sliverappbar/panels/mostaffectedcountries.dart';
import 'package:sliverappbar/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:sliverappbar/panels/datasource.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliverappbar/webview.dart' as web;

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Map Worlddata;

  void _launchcaller(int number) async {
    var url = "tel:${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Couldn\'t Place Call';
    }
  }

  fetchWorldWidedata() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/all?yesterday');
    setState(() {
      Worlddata = json.decode(response.body);
    });
  }

  List CountryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      CountryData = json.decode(response.body);
    });
  }

  List StateData;
  void fetchStateData() async {
    http.Response response =
    await http.get('https://api.covid19india.org/data.json');
    setState(() {
      Map<String, dynamic> map = json.decode(response.body);
      StateData = map["statewise"];
    });
  }

  void initState() {
    fetchWorldWidedata();
    fetchCountryData();
    fetchStateData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _launchcaller(1075);
          },
          label: Text('Call Helpline'),
          icon: Icon(Icons.call),
          backgroundColor: Colors.red[900],
        ),

        //appbar
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 1,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(" ",
                  style: TextStyle(
                      color: Colors.orange[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(

                children: <Widget>[
                  Text("WorldWide",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),

                  SizedBox(height:20.0),
                  SizedBox(width:148),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation, Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.easeInOutCirc);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation)
                              {
                                return  CountryPage();
                              }
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(8.0),
                      child: Text("Country-Wise",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),


                ],
              ),
            ),

            Worlddata == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    Worlddata: Worlddata,
                  ),
            SizedBox(
              height: 10,
            ),
            Row(
              children :<Widget>[
            Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

          child: Text('Most Affected Countries',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              )),

        ),
                SizedBox(width:50),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation, Animation<double> secAnimation,
                                Widget child) {
                              animation = CurvedAnimation(
                                  parent: animation, curve: Curves.bounceInOut);
                              return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation)
                            {
                              return  statewisePage();
                            }
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8.0),
                    child: Text("State-Wise",
                        style: TextStyle(

                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,

                        )),
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 20,
            ),
            CountryData == null
                ? CircularProgressIndicator()
                : MostAffectedPanel(
                    countryData: CountryData,
                  ),




            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Preventions",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            buildPreventation(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: buildHelpCard(context),
            ),

            //sized box card
          ],
        )));
  }


}
//roe buildprevention

Row buildPreventation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      PreventitonCard(
        svgSrc: "assets/icons/hand_wash.svg",
        title: "Wash Hands",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/use_mask.svg",
        title: "Use Masks",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/Clean_Disinfect.svg",
        title: "Clean Disinfect",
      ),
    ],
  );
}

Container buildHelpCard(BuildContext context) {
  return Container(
    height: 150,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            // left side padding is 40% of total width
            left: MediaQuery.of(context).size.width * .4,
            top: 20,
            right: 20,
          ),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1B8D59),
                Color(0xFF60BE93),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Dial 1075 for \nMedical Help!\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: "If any symptoms appear",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SvgPicture.asset("assets/icons/nurse.svg"),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: SvgPicture.asset("assets/icons/virus.svg"),
        ),
      ],
    ),
  );
}

class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black87),
        )
      ],
    );
  }
}

//build card
