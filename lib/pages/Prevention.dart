
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliverappbar/panels/infopanel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliverappbar/pages/selfassess.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (BuildContext context,
                Animation<double> animation, Animation<double> secAnimation,
                    Widget child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.elasticInOut);
                  return ScaleTransition(
                    alignment: Alignment.center,
                    scale: animation,
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation)
                {
                return HomePageDialogflow();
                }
            )
          );

        },

        label: Text('Self Assessment',style: new TextStyle(color: Colors.white,fontSize:20),),
        icon: Icon(Icons.chat,color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: Colors.red[900],
      ),

//wrap singlechildscrollview for correct displaying in small density devices
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    buildTestingCard(context),
                    SizedBox(height: 60),

                    InfoPanel(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  //testinglab

  Container buildTestingCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          GestureDetector(
            onTap :(){launch('https://www.google.com/maps/search/covid+19+testing+centers/@19.2047013,72.7869433,13z/data=!3m1!4b1');},
            child: Container(
              padding: EdgeInsets.only(
                // left side padding is 40% of total width
                right: MediaQuery.of(context).size.width * .4,
                top: 20,
                left: 20,

              ),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [

                    Colors.red,
                  Colors.red[100]
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: RichText(
                text: TextSpan(
                  children: [

                    TextSpan(

                      text: "Labs with COVID-19 \nTesting Facility\n",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),

                    ),


                    TextSpan(
                      text: "See Approved Labs ",



                      style: TextStyle(
                        color: Colors.white.withOpacity(1.0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
    ),

                    ),
                    WidgetSpan(
                      child: new Icon(Icons.touch_app, size: 20,color: Colors.white,),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //child: SvgPicture.asset("assets/icons/lab-icon-17.svg"),
          ),
          Positioned(
            height:110,
            left: 60,
            bottom: 10,
            child: SvgPicture.asset("assets/icons/lab-icon-17.svg"),
          ),
        ],
      ),
    );
  }



}

