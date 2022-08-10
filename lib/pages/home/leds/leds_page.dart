import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get_it/get_it.dart';

import '../../../data/data.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/app_constants.dart';
import 'dart:developer' as developer;

import '../../../utils/utils.dart';

class LedsPage extends StatefulWidget {
  static const path = "LedsPage";
  const LedsPage({Key? key}) : super(key: key);

  @override
  _LedsPageState createState() => _LedsPageState();
}

class _LedsPageState extends State<LedsPage> {
  bool onLed = false;
  final socket = GetIt.instance.get<AuthBloc>().socket;

  Color pickerColor = const Color(0xff000000);

  onLedChange(bool onLed) {
    socket?.emit(
        'led',
        onLed
            ? "ON&0x${pickerColor.value.toRadixString(16).replaceAll("ff", "")}"
            : "OFF&0x${pickerColor.value.toRadixString(16).replaceAll("ff", "")}");
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    socket?.on("led", (data) {
      developer.log('LedLog ${data}', name: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED Control'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
              paletteType: PaletteType.hueWheel,
            ),
            kSpacingHeight48,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onLed = !onLed;
                    });
                    onLedChange(onLed);
                  },
                  style: (onLed)
                      ? ElevatedButton.styleFrom(
                          primary: ColorConstants.primaryColor,
                          side: const BorderSide(
                              color: ColorConstants.primaryColor))
                      : ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          side: const BorderSide(
                              color: ColorConstants.primaryColor)),
                  child: Text(
                    'Led ${onLed ? "ON&" : "OFF"}',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color:
                            onLed ? Colors.white : ColorConstants.primaryColor),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
