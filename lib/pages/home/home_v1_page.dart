import 'package:control_pad/control_pad.dart';
import 'package:flutter/material.dart';
import 'package:project3y21/utils/colors.dart';
import 'dart:developer' as developer;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeV1Page extends StatefulWidget {
  static const path = "HomeV1Page";
  const HomeV1Page({Key? key}) : super(key: key);

  @override
  _HomeV1PageState createState() => _HomeV1PageState();
}

class _HomeV1PageState extends State<HomeV1Page> {
  // IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    connect();
    setState(() {});
  }

  void connect() {
    IO.Socket socket = IO.io(
        'http://192.168.1.12:5000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build()
        //     <String, dynamic>{
        //   "transports": ["websocket"],
        //   "autoConnect": false,
        // }
        );
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    print(socket.connected);
  }

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
