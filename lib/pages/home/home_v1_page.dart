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
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    socket = IO.io('http://192.168.1.12:3000',
        IO.OptionBuilder().setTransports(['websocket']).build());
    connect();
  }

  void connect() {
    developer.log('connecting', name: '');
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
          developer.log("Derece ${degrees}");
          developer.log("mesafe  ${distance}");
        }),
      ),
    );
  }
}
