import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project3y21/pages/authentication/sign_up/sign_up_page.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class AuthenticationNavigator extends StatefulWidget {
  const AuthenticationNavigator({Key? key}) : super(key: key);

  @override
  _AuthenticationNavigatorState createState() =>
      _AuthenticationNavigatorState();
}

class _AuthenticationNavigatorState extends State<AuthenticationNavigator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: 'login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'login':
            return MaterialPageRoute(builder: (context) => const SignInPage());
          case SignUpPage.path:
            return MaterialPageRoute(builder: (context) => const SignUpPage());
        }
      },
    );
  }
}
