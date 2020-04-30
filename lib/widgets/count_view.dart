import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/home_provider.dart';
import 'package:runningapp/provider/timer_provider.dart';

class CountView extends StatefulWidget {
  @override
  _CountViewState createState() => _CountViewState();

}

class _CountViewState extends State<CountView> {

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<TimerProvider>(context);
    final home = Provider.of<HomeProvider>(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment
                        .bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFA9F5F2), Color(0xFF01DFD7)],
                  ),
                  borderRadius: BorderRadius.circular(27),),
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 8.0,
                animation: true,
                animationDuration: 100,
                center: Container(
                  child: new Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 25,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          FontAwesomeIcons.walking,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 40,
                        child: Text(
                          home.stepCount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: home.stepCount > 9999 ? 12.0 : 16,
                              color: Colors.purpleAccent),
                          textAlign: TextAlign.center,

                        ),
                      ),
                    ],
                  ),
                ),
                percent: 0.8,
                footer: new Text(
                  "Steps: " + home.stepCount.toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.purple),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.red,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
              child:  Container(
                child: new Card(
                  child: Container(
                    height: 120.0,
                    width: 120.0,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/clock.png"),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text(
                        time.timeDisplay,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/burned.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  home.caloriesBurned.toString() + " Kcal",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white),
                ),
              ),
              color: Colors.transparent,
            ),
            Card(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/distance.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Text(
                  home.distance.toString() + " Km",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.yellow),
                ),
              ),
              color: Colors.transparent,
            ),
            Card(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/barras.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Text(
                  "",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white),
                ),
              ),
              color: Colors.transparent,
            ),
          ],
        )

      ],
    );
  }
}
