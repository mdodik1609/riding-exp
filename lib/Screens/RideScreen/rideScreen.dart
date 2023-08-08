import 'package:flutter/material.dart';
import 'package:riding_exp/Screens/MainScreen/components/ride.dart';
import 'package:riding_exp/main.dart';

class Ride extends StatelessWidget {
  final code;
  Ride(this.code);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RideButtonsScreen(code),
    );
  }
}
