import 'package:flutter/material.dart';

import 'package:riding_exp/constants.dart';
import 'package:riding_exp/main.dart';
import 'package:url_launcher/url_launcher.dart';

class FormsScreen extends StatefulWidget {
  FormsScreen();

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

_launchURL_PassangerReview() async {
  final url = tripPassenger;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL_DriverReview() async {
  final url = tripDriver;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchHome(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
}

class _FormsScreenState extends State<FormsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
        type: MaterialType.transparency,
        child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(-0.4, -0.8),
                stops: [0.0, 0.5, 0.5, 1],
                colors: [
                  Color(0xFF2a2a2a),
                  Color(0xFF3F3F3F),
                  Color(0xFF2a2a2a),
                  Color(0xFF3F3F3F),
                ],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: size.height / 10),
                  child: Text(
                    appName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      color: kWhite2,
                      fontSize: 42,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height / 10),
                  child: Container(
                      width: size.width - 50,
                      height: size.height / 8,
                      padding: EdgeInsets.only(left: 0, top: size.height / 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: <Color>[kOrange, kOrangeDeep])),
                        child: FlatButton(
                            minWidth: size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.005,
                                horizontal: size.width * 0.05),
                            onPressed: () async {
                              _launchURL_PassangerReview();
                            },
                            child: Text(
                              "Passenger's review",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeButton,
                                  color: kWhite2),
                            )),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height / 10),
                  child: Container(
                      width: size.width - 50,
                      height: size.height / 8,
                      padding: EdgeInsets.only(left: 0, top: size.height / 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: <Color>[kOrange, kOrangeDeep])),
                        child: FlatButton(
                            minWidth: size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.005,
                                horizontal: size.width * 0.05),
                            onPressed: () async {
                              _launchURL_DriverReview();
                            },
                            child: Text(
                              "Driver's review",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeButton,
                                  color: kWhite2),
                            )),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height / 10),
                  child: Container(
                      width: size.width - 50,
                      height: size.height / 8,
                      padding: EdgeInsets.only(left: 0, top: size.height / 25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPinkDarker),
                        child: FlatButton(
                            minWidth: size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.005,
                                horizontal: size.width * 0.05),
                            onPressed: () async {
                              _launchHome(context);
                            },
                            child: Text(
                              "Main Screen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeButton,
                                  color: kWhite2),
                            )),
                      )),
                ),
              ],
            )));
  }
}
