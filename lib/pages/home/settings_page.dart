import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/auth/auth_bloc.dart';

class SettingsPage extends StatefulWidget {
  static const path = "SettingsPage";
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              context.read<AuthBloc>().logout();
            },
            child: const Text('Log out')),
      ),
    );
  }
}
