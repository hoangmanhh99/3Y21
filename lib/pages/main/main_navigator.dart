import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../home/voice/alan_voice_page.dart';
import '../pages.dart';

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
