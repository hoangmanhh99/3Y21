import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages.dart';
import 'app_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  final int initialPage;

  const HomePage(this.initialPage, {Key? key}) : super(key: key);

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
          GuidesPage(),
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
