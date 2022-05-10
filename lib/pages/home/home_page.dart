import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/data/blocs/auth/auth.dart';
import 'package:flutter_application/lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  final int initialPage;

  HomePage(this.initialPage);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {});
        },
        children: const [
          HomeV1Page(),
          DeviceControlPage(),
          VoicePage(),
          SettingsPage()
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        pageController: _pageController,
      ),
    );
  }
}
