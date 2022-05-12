import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/pages/home/voice/alan_voice_page.dart';
import 'package:flutter_application/pages/home/voice/voice_page.dart';
import 'package:flutter_application/pages/home/device_control_page.dart';
import 'package:flutter_application/pages/home/home_page.dart';
import 'package:flutter_application/pages/home/home_v1_page.dart';
import 'package:flutter_application/pages/home/settings_page.dart';
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
          case HomeV1Page.path:
            return MaterialPageRoute(builder: (context) => HomePage(1));
          case VoicePage.path:
            return MaterialPageRoute(builder: (context) => HomePage(2));
          case DeviceControlPage.path:
            return MaterialPageRoute(builder: (context) => HomePage(3));
          case SettingsPage.path:
            return MaterialPageRoute(builder: (context) => HomePage(4));
          case AlanVoicePage.path:
            return MaterialPageRoute(
                builder: (context) => const AlanVoicePage());
        }
      },
    );
  }
}
