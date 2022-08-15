import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3y21/pages/home/settings/change_alert_info_page.dart';
import 'package:project3y21/pages/pages.dart';
import 'package:project3y21/utils/utils.dart';

import '../../../data/blocs/auth/auth_bloc.dart';
import '../../../widgets/widgets.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 90,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: Text(
                  "Dự án điều khiển xe Arduino",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                )),
            kSpacingHeight16,
            _buildItem("Speed car", () {
              Navigator.pushNamed(context, ChangeSpeedPage.path);
            }),
            _buildItem("Change Color Alert", () {
              Navigator.pushNamed(context, ChangeAlertInfoPage.path);
            }),
            _buildItem("Guides", () {
              Navigator.pushNamed(context, GuidesPage.path);
            }),
            _buildItem("Change Color Joystick", () {
              Navigator.pushNamed(context, GuidesPage.path);
            }),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: MyElevatedButton(
                'Log out',
                onPressed: () async {
                  context.read<AuthBloc>().logout();
                },
              ),
            ),
            kSpacingHeight36
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, Function callback) {
    return InkWell(
      onTap: () {
        callback.call();
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
