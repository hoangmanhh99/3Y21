import 'package:flutter/material.dart';
import 'package:project3y21/data/data.dart';
import 'package:project3y21/utils/utils.dart';
import 'package:project3y21/widgets/my_elevated_button.dart';
import 'dart:developer' as developer;

import 'package:supabase_flutter/supabase_flutter.dart';

// final client = Supabase.instance.client;

class ChangeSpeedPage extends StatefulWidget {
  static const path = 'ChangeSpeedPage';
  const ChangeSpeedPage({Key? key}) : super(key: key);

  @override
  State<ChangeSpeedPage> createState() => _ChangeSpeedPageState();
}

class _ChangeSpeedPageState extends State<ChangeSpeedPage> {
  final speedController = TextEditingController();
  final Future<String> _future = BaseRepositoryImpl().getSpeedCar();

  @override
  void initState() {
    super.initState();
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
            FutureBuilder<String>(
                future: _future,
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  speedController.text = snap.data!;
                  developer.log('SpeedCar ${snap.data!}', name: '');
                  return Column(
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
                  );
                }),
            const Spacer(),
            MyElevatedButton("Save", onPressed: () async {
              await context.runTask(
                  BaseRepositoryImpl().updateSpeedCar(speedController.text)).then((value) {
                    Navigator.pop(context);
              });
              // SharedPreferencesUtils.setData(
              //     NetworkConstants.speedArduino, speedController);
            })
          ],
        ),
      ),
    );
  }
}
