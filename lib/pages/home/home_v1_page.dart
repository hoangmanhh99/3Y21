import 'package:control_pad/control_pad.dart';
import 'package:flutter/material.dart';
import 'package:project3y21/utils/colors.dart';
import 'dart:developer' as developer;

class HomeV1Page extends StatefulWidget {
  static const path = "HomeV1Page";
  const HomeV1Page({Key? key}) : super(key: key);

  @override
  _HomeV1PageState createState() => _HomeV1PageState();
}

class _HomeV1PageState extends State<HomeV1Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: JoystickView(
        onDirectionChanged: ((degrees, distance) {
          developer.log("Derece ${degrees}");
          developer.log("mesafe  ${distance}");
        }),
      ),
    );
  }
}
