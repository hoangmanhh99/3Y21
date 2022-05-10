import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../utils/app_constants.dart';
import 'dart:developer' as developer;

class DeviceControlPage extends StatefulWidget {
  static const ROUTE_NAME = "DeviceControlPage";
  const DeviceControlPage({Key? key}) : super(key: key);

  @override
  _DeviceControlPageState createState() => _DeviceControlPageState();
}

class _DeviceControlPageState extends State<DeviceControlPage> {
  static const TAG = "DeviceControlPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Control'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                    onTap: () {
                      developer.log('Up', name: '');
                    },
                    radius: 56,
                    child: SvgPicture.asset(Assets.icons.icArrowUp))
              ],
            ),
            kSpacingHeight4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkResponse(
                    onTap: () {
                      developer.log('Left', name: '');
                    },
                    radius: 56,
                    child: SvgPicture.asset(Assets.icons.icArrowLeft)),
                InkResponse(
                    onTap: () {
                      developer.log('Right', name: '');
                    },
                    radius: 56,
                    child: SvgPicture.asset(Assets.icons.icArrowRight)),
              ],
            ),
            kSpacingHeight4,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                    onTap: () {
                      developer.log('Down', name: '');
                    },
                    radius: 56,
                    child: SvgPicture.asset(Assets.icons.icArrowDown))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
