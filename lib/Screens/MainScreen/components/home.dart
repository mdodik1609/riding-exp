import 'package:riding_exp/Screens/MainScreen/components/ride.dart';
import 'package:riding_exp/Screens/RideScreen/rideScreen.dart';
import 'package:riding_exp/constants.dart';
import 'package:riding_exp/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

_getMail() async {
  final prefs = await SharedPreferences.getInstance();
  final key = "mail";
  final String value = prefs.getString(key);
  return value;
}

Future<bool> _saveMail(mail, context) async {
  if (mail == null || mail == '') {
    return false;
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(mail)) {
    _toastMessage("Your mail is not valid.", context);
    return false;
  }
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("mail", mail);
  return true;
}

_toastMessage(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: kWhite2,
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: kBlack),
    ),
    duration: const Duration(milliseconds: 3000),
    width: context.size.width * (2 / 3), // Width of the SnackBar.
    padding: const EdgeInsets.symmetric(
        horizontal: 20.0, vertical: 10 // Inner padding for SnackBar content.
        ),

    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ));
}

_openMailForm(context) async {
  final mailController = TextEditingController();
  String currentMail =
      (await SharedPreferences.getInstance()).getString("mail");
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBlack,
          title: Text(
            'Enter passanger e-mail:',
            style: TextStyle(color: kBlue2),
          ),
          content: SingleChildScrollView(
              child: ListBody(
            children: <Widget>[
              TextField(
                maxLength: 30,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kBlue2, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kYellow2, width: 2.0)),
                  hintText: 'mail@mail.com',
                  counterText: "",
                  hintStyle: TextStyle(
                    color: kGrey,
                  ),
                ),
                style: TextStyle(
                  color: kWhite2,
                ),
                controller: mailController,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                "Current e-mail:",
                style: TextStyle(color: kGrey),
              ),
              Text(
                currentMail,
                style: TextStyle(color: kGrey),
              )
            ],
          )),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: kWhite),
              ),
              onPressed: () async {
                bool res = false;
                await _saveMail(mailController.text, context)
                    .then((result) => res = result);
                if (res == true) {
                  Navigator.of(context).pop();
                  final prefs = await SharedPreferences.getInstance();
                  final key = "mail";
                  print(prefs.getString(key));
                  _toastMessage("Mail is saved.", context);
                } else {
                  Navigator.of(context).pop();
                  print("Nije sejvan mail");
                  _toastMessage("Mail is not saved.", context);
                }
              },
            ),
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: TextStyle(color: kWhite),
                )),
          ],
        );
      });
}

_launchRide(context, code) async {
  if (code.length < 5) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kBlack,
            title: Text(
              'Invalid code',
              style: TextStyle(color: kBlue2),
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                  'Code you entered is too short',
                  style: TextStyle(color: kWhite),
                ),
              ],
            )),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: kWhite),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  ;
  if (code.length == 5) {
    String mail = _getMail().toString();
    if (mail == null || mail == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please set up your mail."),
      ));
      await _openMailForm(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ride(code)));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Your ride code does not contain 5 characters."),
    ));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
  }
}

_launchURL_PassangerInformation() async {
  final passangerMail = await _getMail();
  // final url = infoPassengerPrefill + passangerMail;
  final url = infoPassanger;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL_DriverInformation() async {
  final url = infoDriver;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final myController = TextEditingController();
    SystemChrome.setEnabledSystemUIOverlays([]);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
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
              padding: EdgeInsets.only(top: size.height / 5),
              child: Text(
                "Enter driver's code",
                style: TextStyle(
                    color: kOrange, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              width: size.width / 1.5,
              child: TextField(
                maxLength: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kBlue2, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kYellow2, width: 2.0)),
                  hintText: 'Enter code  [5 characters]',
                  counterText: "",
                  hintStyle: TextStyle(
                    color: kGrey,
                  ),
                ),
                style: TextStyle(
                  color: kWhite2,
                ),
                controller: myController,
              ),
            ),
            Container(
              child: FlatButton(
                  minWidth: 120,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.05),
                  onPressed: () async {
                    _launchRide(context, myController.text);
                  },
                  color: kOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.normal,
                        fontSize: fontSizeButton,
                        color: kWhite2),
                  )),
            ),
            GestureDetector(
                onTap: () {
                  _launchURL_PassangerInformation();
                },
                child: Container(
                  child: Text(
                    passengerText,
                    style: TextStyle(
                        fontFamily: 'Arial',
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal,
                        fontSize: fontSizeButton * 0.6,
                        color: kWhite2),
                  ),
                )),
            Container(),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: size.height / 5, left: size.width / 8.5),
                    child: Icon(
                      Icons.drive_eta_rounded,
                      color: kOrange.withOpacity(0.7),
                      size: size.width / 5,
                    )),
                Container(
                  child: GestureDetector(
                      onTap: () {
                        _launchURL_DriverInformation();
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: size.height / 4.8, left: size.width / 50),
                        child: Text(
                          driverText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Arial',
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                              fontSize: fontSizeButton * 0.6,
                              color: kWhite2),
                        ),
                      )),
                ),
                GestureDetector(
                    onTap: () {
                      _openMailForm(context);
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: size.height / 5, left: size.width / 50),
                        child: Icon(
                          Icons.edit,
                          color: kOrange.withOpacity(0.7),
                          size: size.width / 6,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
