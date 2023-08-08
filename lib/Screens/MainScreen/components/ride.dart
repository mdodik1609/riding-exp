import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;
import 'package:riding_exp/Database/database.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:riding_exp/constants.dart';

import 'forms.dart';

class RideButtonsScreen extends StatefulWidget {
  final code;
  RideButtonsScreen(this.code);

  @override
  _RideButtonsScreenState createState() => _RideButtonsScreenState();
}

class _RideButtonsScreenState extends State<RideButtonsScreen> {
  final String button1 = "Fast acceleration";
  final String button2 = "Sudden braking";
  final String button3 = "Not using blinkers";
  final String button4 = "Crossing red light";
  final String button5 = "Turn at high speed";
  final String button6 = "Car slalom";
  final String button7 = "Not letting pedestrian cross";
  final String button8 = "Close to car ahead";

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
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: size.height / 20),
                child: Text(
                  "Trip id : " + widget.code,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhite2,
                      fontSize: 30,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                height: size.height / 20,
                width: size.width,
              ),
              Container(
                width: size.width,
                height: 8,
                color: kOrange,
              ),
              //
              //
              //Buttons
              //
              //
              Container(
                padding: EdgeInsets.only(top: size.height / 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: size.width / 2 - 20,
                        height: size.height / 8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[kOrange, kOrangeDeep])),
                          child: FlatButton(
                              minWidth: size.width / 2 - 20,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.005,
                                  horizontal: size.width * 0.05),
                              onPressed: () async {
                                await _insetIntoDB(Flag(button1,
                                        DateTime.now().toString(), widget.code)
                                    .toJson());
                              },
                              child: Text(
                                button1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSizeButton,
                                    color: kWhite2),
                              )),
                        )),
                    Container(
                      width: size.width / 2 - 20,
                      height: size.height / 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: <Color>[kOrange, kOrangeDeep])),
                      child: FlatButton(
                          minWidth: size.width / 2 - 20,
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.05),
                          onPressed: () async {
                            _insetIntoDB(Flag(button2,
                                    DateTime.now().toString(), widget.code)
                                .toJson());
                          },
                          child: Text(
                            button2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal,
                                fontSize: fontSizeButton,
                                color: kWhite2),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height / 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width / 2 - 20,
                      height: size.height / 8,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: <Color>[kOrange, kOrangeDeep])),
                        child: FlatButton(
                            minWidth: size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.005,
                                horizontal: size.width * 0.05),
                            onPressed: () async {
                              _insetIntoDB(Flag(button3,
                                      DateTime.now().toString(), widget.code)
                                  .toJson());
                            },
                            child: Text(
                              button3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeButton,
                                  color: kWhite2),
                            )),
                      ),
                    ),
                    Container(
                      width: size.width / 2 - 20,
                      height: size.height / 8,
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
                            _insetIntoDB(Flag(button4,
                                    DateTime.now().toString(), widget.code)
                                .toJson());
                          },
                          child: Text(
                            button4,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal,
                                fontSize: fontSizeButton,
                                color: kWhite2),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height / 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: size.width / 2 - 20,
                        height: size.height / 8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[kOrange, kOrangeDeep])),
                          child: FlatButton(
                              minWidth: size.width / 2 - 20,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.005,
                                  horizontal: size.width * 0.05),
                              onPressed: () async {
                                _insetIntoDB(Flag(button5,
                                        DateTime.now().toString(), widget.code)
                                    .toJson());
                              },
                              child: Text(
                                button5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSizeButton,
                                    color: kWhite2),
                              )),
                        )),
                    Container(
                      height: size.height / 8,
                      width: size.width / 2 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: <Color>[kOrange, kOrangeDeep])),
                      child: FlatButton(
                          minWidth: size.width / 2 - 20,
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.05),
                          onPressed: () async {
                            _insetIntoDB(Flag(button6,
                                    DateTime.now().toString(), widget.code)
                                .toJson());
                          },
                          child: Text(
                            button6,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal,
                                fontSize: fontSizeButton,
                                color: kWhite2),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height / 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: size.width / 2 - 20,
                        height: size.height / 8,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: <Color>[kOrange, kOrangeDeep])),
                          child: FlatButton(
                              minWidth: size.width / 2 - 20,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.005,
                                  horizontal: size.width * 0.05),
                              onPressed: () async {
                                _insetIntoDB(Flag(button7,
                                        DateTime.now().toString(), widget.code)
                                    .toJson());
                              },
                              child: Text(
                                button7,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSizeButton,
                                    color: kWhite2),
                              )),
                        )),
                    Container(
                      width: size.width / 2 - 20,
                      height: size.height / 8,
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
                            _insetIntoDB(Flag(button8,
                                    DateTime.now().toString(), widget.code)
                                .toJson());
                          },
                          child: Text(
                            button8,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.normal,
                                fontSize: fontSizeButton,
                                color: kWhite2),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
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
                          _launchForms();
                        },
                        child: Text(
                          "STOP RIDE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.normal,
                              fontSize: fontSizeButton,
                              color: kWhite2),
                        )),
                  )),
            ])));
  }

  _launchForms() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormsScreen()));
  }

  Future<void> _insetIntoDB(Map<String, dynamic> json) async {
    // await Process.run('java', [
    //   'package:riding_exp/Database/dbConnection.jar',
    //   json.toString()
    // ]).then((ProcessResult results) {
    //   print(results.stdout);
    //   print(results.stderr);
    // }).catchError((e) {
    //   print(e);
    // });

    await MongoDatabase.connect();
    var result = await MongoDatabase.insert(json); //toast add
    MongoDatabase.closeConnection();

    String stringJsonMessage = json.entries.first.value;

    if (result) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kWhite2,
        content: Text(
          "Flag: \"" + stringJsonMessage + "\" is saved.",
          textAlign: TextAlign.center,
          style: TextStyle(color: kBlack),
        ),
        duration: const Duration(milliseconds: 3000),
        width: context.size.width * (2 / 3), // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10 // Inner padding for SnackBar content.
            ),

        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kWhite2,
        content: Text(
          "Flag: \"" + stringJsonMessage + "\" is not saved.",
          textAlign: TextAlign.center,
          style: TextStyle(color: kBlack),
        ),
        duration: const Duration(milliseconds: 3000),
        width: context.size.width * (2 / 3), // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10 // Inner padding for SnackBar content.
            ),

        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
    }
  }
}

class Flag {
  final String message;
  final String dateTime;
  final String rideCode;

  Flag(this.message, this.dateTime, this.rideCode);

  Flag.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        dateTime = json['dateTime'],
        rideCode = json['rideCode'];

  Map<String, dynamic> toJson() =>
      {'message': message, 'dateTime': dateTime, 'rideCode': rideCode};
}
