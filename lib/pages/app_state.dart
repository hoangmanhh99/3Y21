import 'package:flutter/material.dart';

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(),
        onWillPop: () async {
          WidgetsBinding.instance?.removeObserver(this);
          return true;
        });
  }
}
