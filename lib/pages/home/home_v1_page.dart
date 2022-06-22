import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project3y21/utils/app_constants.dart';
import 'package:project3y21/utils/colors.dart';
import 'package:project3y21/utils/share_preference_utils.dart';
import 'dart:developer' as dev;
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../widgets/control_pad/views/joystick_view.dart';

class HomeV1Page extends StatefulWidget {
  static const path = "HomeV1Page";
  const HomeV1Page({Key? key}) : super(key: key);

  @override
  _HomeV1PageState createState() => _HomeV1PageState();
}

class _HomeV1PageState extends State<HomeV1Page> {
  late IO.Socket socket;
  String oldDirection = "S";
  bool onLed = false;
  String address =
      SharedPreferencesUtils.getData(NetworkConstants.addressServer);

  @override
  void initState() {
    super.initState();

    /// http://localhost:3000
    /// https://arduino-socket-app.herokuapp.com
    dev.log('NetworkConstants.ipAddress ${NetworkConstants.ipAddress}');
    socket = IO.io(
        address,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .build());
    connect();
  }

  void connect() {
    dev.log('connecting', name: '');
    socket.onConnect((data) {
      print('Connection established');
      Fluttertoast.showToast(
          msg: 'Connection established', gravity: ToastGravity.CENTER);
    });
    socket.onConnectError((data) {
      print('Connect Error: $data');
      Fluttertoast.showToast(
          msg: 'Connect Error', gravity: ToastGravity.CENTER);
    });
    socket.onDisconnect((data) {
      print('Socket server disconnected');
      Fluttertoast.showToast(
          msg: 'Socket server disconnected', gravity: ToastGravity.CENTER);
    });
  }

  String? getDirection(double degrees, double distance) {
    if (distance != 0.00) {
      if ((degrees >= 0 && degrees < 30) ||
          (degrees >= 330 && degrees <= 360)) {
        return "F";
      } // goAhead
      if (degrees <= 210 && degrees >= 150) return "B"; // goBack
      if (degrees <= 120 && degrees >= 60) return "R"; // goRight
      if (degrees <= 300 && degrees >= 240) return "L"; // goLeft
      if (degrees < 330 && degrees > 300) return "G"; // goAheadLeft
      if (degrees < 60 && degrees > 30) return "I"; // goAheadRight
      if (degrees < 240 && degrees > 210) return "J"; // goBackLeft
      if (degrees < 150 && degrees > 120) return "H"; // goBackLeft
    } else {
      return "S"; // stop
    }
    return null;
  }

  String nameDirection(String direction) {
    switch (direction) {
      case "F":
        return 'Go Ahead';
      case "B":
        return "Go Back";
      case "R":
        return "Go Right";
      case "L":
        return "Go Left";
      case "G":
        return "Go Ahead Left";
      case "I":
        return "Go Ahead Right";
      case "J":
        return "Go Back Right";
      case "H":
        return "Go Back Left";
      default:
        return "Stop";
    }
  }

  onLedChange(bool onLed) {
    socket.emit('led', onLed ? 1 : 0);
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    JoystickDirectionCallback? onDirectionChangedMovement(
        double degrees, double distance) {
      String? direction = getDirection(degrees, distance);
      dev.log('$direction');
      if (oldDirection != direction) {
        oldDirection = direction ?? "S";
        setState(() {});
        socket.emit('direction', direction);
      }
      return null;
    }

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JoystickView(
            onDirectionChanged: onDirectionChangedMovement,
          ),
          Container(
            padding: const EdgeInsets.only(top: 64),
            child: Text(
              nameDirection(oldDirection),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          kSpacingHeight48,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    onLed = !onLed;
                  });
                  onLedChange(onLed);
                },
                style: (onLed)
                    ? ElevatedButton.styleFrom(
                        primary: ColorConstants.primaryColor,
                        side: const BorderSide(
                            color: ColorConstants.primaryColor))
                    : ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        side: const BorderSide(
                            color: ColorConstants.primaryColor)),
                child: Text(
                  'Led ${onLed ? "ON" : "OFF"}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color:
                          onLed ? Colors.white : ColorConstants.primaryColor),
                )),
          ),
          kSpacingHeight24,
          Text(
            address,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
