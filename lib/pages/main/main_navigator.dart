import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/pages/home/chat_page.dart';
import 'package:flutter_application/pages/home/device_control_page.dart';
import 'package:flutter_application/pages/home/home_page.dart';
import 'package:flutter_application/pages/home/home_v1_page.dart';
import 'package:flutter_application/pages/home/information_page.dart';
import 'package:flutter_application/utils/navigator_support.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: 'home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(builder: (context) => HomePage(1));
          case HomeV1Page.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => HomePage(1));
          case ChatPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => HomePage(2));
          case DeviceControlPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => HomePage(3));
          case InformationPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (context) => HomePage(4));
        }
      },
    );
  }
}
