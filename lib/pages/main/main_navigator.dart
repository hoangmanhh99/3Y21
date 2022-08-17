import 'package:flutter/material.dart';
import 'package:project3y21/pages/home/home_new_page.dart';
import 'package:project3y21/pages/home/settings/change_alert_info_page.dart';
import '../../utils/utils.dart';
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
            return MaterialPageRoute(builder: (context) => const HomeNewPage());
          // case 'home':
          //   return MaterialPageRoute(builder: (context) => HomePage(1));
          case HomeV1Page.path:
            return MaterialPageRoute(builder: (context) => HomePage(1));
          case VoicePage.path:
            return MaterialPageRoute(builder: (context) => HomePage(2));
          case LedsPage.path:
            return MaterialPageRoute(builder: (context) => HomePage(3));
          case SettingsPage.path:
            return MaterialPageRoute(builder: (context) => HomePage(4));
          case ChangeSpeedPage.path:
            return MaterialPageRoute(
                builder: (context) => const ChangeSpeedPage());
          case GuidesPage.path:
            return MaterialPageRoute(
                builder: (context) => const GuidesPage());
          case ChangeAlertInfoPage.path:
            return MaterialPageRoute(
                builder: (context) => const ChangeAlertInfoPage());
          // case AlanVoicePage.path:
          //   return MaterialPageRoute(
          //       builder: (context) => const AlanVoicePage());
        }
      },
    );
  }
}
