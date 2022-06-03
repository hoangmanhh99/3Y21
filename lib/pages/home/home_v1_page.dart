import 'package:flutter/material.dart';
import 'package:project3y21/utils/app_constants.dart';
import 'package:project3y21/utils/colors.dart';
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

  @override
  void initState() {
    super.initState();
    /// 192.168.1.12
    dev.log('NetworkConstants.ipAddress ${NetworkConstants.ipAddress}');
    socket = IO.io('http://10.9.11.160:3000',
        IO.OptionBuilder().setTransports(['websocket']).build());
    connect();
  }

  void connect() {
    dev.log('connecting', name: '');
    socket.onConnect((data) => print('Connection establised'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket server disconnected'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: JoystickView(
        onDirectionChanged: ((degrees, distance) {
          dev.log("Derece ${degrees}");
          dev.log("mesafe  ${distance}");
        }),
      ),
    );
  }
}
