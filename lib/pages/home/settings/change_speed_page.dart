import 'package:flutter/material.dart';
import 'package:project3y21/utils/utils.dart';
import 'package:project3y21/widgets/my_elevated_button.dart';
import 'dart:developer' as developer;

class ChangeSpeedPage extends StatefulWidget {
  static const path = 'ChangeSpeedPage';
  const ChangeSpeedPage({Key? key}) : super(key: key);

  @override
  State<ChangeSpeedPage> createState() => _ChangeSpeedPageState();
}

class _ChangeSpeedPageState extends State<ChangeSpeedPage> {
  final speedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    speedController.text =
        SharedPreferencesUtils.getData(NetworkConstants.speedArduino);
    developer.log('${SharedPreferencesUtils.getData(NetworkConstants.speedArduino)}', name: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Speed Car",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Speed Car (From 0 - 255)",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                kSpacingHeight4,
                TextFormField(
                  controller: speedController,
                )
              ],
            ),
            const Spacer(),
            MyElevatedButton("Save", onPressed: () {
              SharedPreferencesUtils.setData(
                  NetworkConstants.speedArduino, speedController);
            })
          ],
        ),
      ),
    );
  }
}
