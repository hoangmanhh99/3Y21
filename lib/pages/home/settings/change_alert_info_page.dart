import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:project3y21/data/data.dart';
import 'package:project3y21/utils/utils.dart';
import 'package:project3y21/widgets/my_elevated_button.dart';
import 'dart:developer' as developer;

import 'package:supabase_flutter/supabase_flutter.dart';

class ChangeAlertInfoPage extends StatefulWidget {
  static const path = 'ChangeAlertInfoPage';
  const ChangeAlertInfoPage({Key? key}) : super(key: key);

  @override
  State<ChangeAlertInfoPage> createState() => _ChangeAlertInfoPageState();
}

class _ChangeAlertInfoPageState extends State<ChangeAlertInfoPage> {
  final distanceController = TextEditingController();
  final Future<String> _futureColor = BaseRepositoryImpl().getColorAlert();
  final Future<double?> _futureDistance =
      BaseRepositoryImpl().getDistanceAlert();

  String colorPicker = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Alert Info",
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
            FutureBuilder<String>(
              future: _futureColor,
              builder: (context, snap) {
                if (!snap.hasData) {
                  if (snap.hasError) {
                    return Center(
                      child: Text(
                        snap.error.toString(),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // distanceController.text = snap.data!.toString();
                developer.log('ColorAlertLog ${snap.data!}', name: '');
                colorPicker = snap.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Change Alert Color",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    kSpacingHeight4,
                    ColorPicker(
                        pickerColor: Color(
                          int.parse('0xFF${snap.data!}'),
                        ),
                        paletteType: PaletteType.hueWheel,
                        onColorChanged: (color) {
                          // setState(() {
                          colorPicker =
                              color.value.toRadixString(16).substring(2);
                          developer.log(
                              '${color.value.toRadixString(16).substring(2)}',
                              name: '');
                          // });
                        })
                  ],
                );
              },
            ),
            kSpacingHeight12,
            FutureBuilder<double?>(
              future: _futureDistance,
              builder: (context, snap) {
                if (!snap.hasData) {
                  if (snap.hasError) {
                    return Center(
                      child: Text(
                        snap.error.toString(),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                distanceController.text = (snap.data ?? 20.0).toString();
                developer.log('DistanceAlertLog ${snap.data!}', name: '');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Distance Alert",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    kSpacingHeight4,
                    TextFormField(
                      controller: distanceController,
                    )
                  ],
                );
              },
            ),
            const Spacer(),
            MyElevatedButton(
              "Save",
              onPressed: () async {
                await context
                    .runTask(
                  BaseRepositoryImpl()
                      .updateDistanceAlert(double.parse(distanceController.text))
                      .then(
                    (value) async {
                      await BaseRepositoryImpl().updateAlertColor(colorPicker);
                    },
                  ),
                )
                    .then(
                  (value) {
                    Navigator.pop(context);
                  },
                );
                // SharedPreferencesUtils.setData(
                //     NetworkConstants.speedArduino, speedController);
              },
            )
          ],
        ),
      ),
    );
  }
}
