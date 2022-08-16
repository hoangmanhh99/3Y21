import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project3y21/data/blocs/alert/alert_bloc.dart';
import 'package:project3y21/data/blocs/alert/alert_state.dart';
import 'package:project3y21/utils/app_constants.dart';
import 'package:project3y21/utils/share_preference_utils.dart';
import 'dart:developer' as developer;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data.dart';
import '../../../widgets/control_pad/views/joystick_view.dart';

class HomeV1Page extends StatefulWidget {
  static const path = "HomeV1Page";
  const HomeV1Page({Key? key}) : super(key: key);

  @override
  _HomeV1PageState createState() => _HomeV1PageState();
}

class _HomeV1PageState extends State<HomeV1Page> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String oldDirection = "S";
  bool onLed = false;
  String address =
      SharedPreferencesUtils.getData(NetworkConstants.addressServer);
  final socket = GetIt.instance.get<AuthBloc>().socket;
  String speedCar = "";
  String distance = '';
  StreamController<String> distanceValue = StreamController.broadcast();

  StreamController<bool> haveAlert = StreamController.broadcast();

  @override
  void initState() {
    super.initState();

    socket?.on("distance", (data) {
      // setState(() {
      //   distance = data;
      // });
      distanceValue.sink.add(data);
      // if (double.parse(distance) < 20) {
      //   _audioPlayer.play(AssetSource("assets/sounds/s_alarm.mp3"));
      // }
      developer.log('ConnectionDistanceLog ${data}');
    });

    context.read<AlertBloc>().fetchAlertInfo();
  }

  String? getDirection(double degrees, double distance) {
    if (distance != 0.00) {
      if ((degrees >= 0 && degrees < 30) ||
          (degrees >= 330 && degrees <= 360)) {
        return "F";
      } // goAhead
      if (degrees <= 210 && degrees >= 150) return "B"; // goBack
      if (degrees <= 120 && degrees >= 60) return "R"; // goRight
      if (degrees <= 300 && degrees >= 240) return "L"; // goLeft
      if (degrees < 330 && degrees > 300) return "G"; // goAheadLeft
      if (degrees < 60 && degrees > 30) return "I"; // goAheadRight
      if (degrees < 240 && degrees > 210) return "J"; // goBackLeft
      if (degrees < 150 && degrees > 120) return "H"; // goBackLeft
    } else {
      return "S"; // stop
    }
    return null;
  }

  String nameDirection(String direction) {
    switch (direction) {
      case "F":
        return 'Go Ahead';
      case "B":
        return "Go Back";
      case "R":
        return "Go Right";
      case "L":
        return "Go Left";
      case "G":
        return "Go Ahead Left";
      case "I":
        return "Go Ahead Right";
      case "J":
        return "Go Back Right";
      case "H":
        return "Go Back Left";
      default:
        return "Stop";
    }
  }

  onLedChange(bool onLed) {
    socket?.emit('led', onLed ? "ON" : "OFF");
  }

  @override
  void dispose() {
    super.dispose();
    // socket?.disconnect();
    socket?.off("distance");
    distanceValue.close();
  }

  @override
  Widget build(BuildContext context) {
    JoystickDirectionCallback? onDirectionChangedMovement(
        double degrees, double distance) {
      String? direction = getDirection(degrees, distance);
      developer.log('$direction');
      if (oldDirection != direction) {
        oldDirection = direction ?? "S";
        setState(() {});
        socket?.emit('direction', "$direction&$speedCar");
      }
      return null;
    }

    JoystickDirectionCallback? onDirectionChangedMovementWithoutForward(
        double degrees, double distance) {
      String? direction = getDirection(degrees, distance);
      developer.log('$direction');
      if (oldDirection != direction && direction != "F") {
        oldDirection = direction ?? "S";
        setState(() {});
        socket?.emit('direction', "$direction&$speedCar");
      }
      return null;
    }

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<AlertBloc, AlertState>(
            builder: (context, state) {
              return state.when(
                (distanceAlert, colorAlert) {
                  Color colorA = Color(int.parse('0xFF$colorAlert'));
                  return StreamBuilder(
                    stream: distanceValue.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        if (snapshot.hasError) {
                          return Text(
                            snapshot.error.toString(),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (double.parse(snapshot.requireData.toString()) <
                              distanceAlert &&
                          double.parse(snapshot.requireData.toString()) >= 0) {
                        haveAlert.sink.add(true);
                        _audioPlayer.play(
                          AssetSource("sounds/s_alarm.mp3"),
                        );
                        for (int i = 0; i < 10; i++) {
                          socket?.emit('led',
                              "ON&r${colorA.red}g${colorA.green}b${colorA.blue}*");
                          socket?.emit('led',
                              "OFF&r${colorA.red}g${colorA.green}b${colorA.blue}*");
                        }
                      } else {
                        haveAlert.sink.add(false);
                      }
                      return Text(
                        '${snapshot.requireData}',
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 36,
          ),
          StreamBuilder(
              stream: haveAlert.stream,
              initialData: false,
              builder: (context, snap) {
                return JoystickView(
                  onDirectionChanged: (snap.data == false)
                      ? onDirectionChangedMovement
                      : onDirectionChangedMovementWithoutForward,
                );
              }),
          Container(
            padding: const EdgeInsets.only(top: 64),
            child: Text(
              nameDirection(oldDirection),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          kSpacingHeight48,
          FutureBuilder<String>(
            future: BaseRepositoryImpl().getSpeedCar(),
            builder: (context, snap) {
              if (!snap.hasData) {
                if (snap.hasError) {
                  return Center(
                    child: Text(snap.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              speedCar = snap.data!;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Speed Car: "),
                  Text(
                    snap.data!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(),
                  ),
                ],
              );
            },
          ),
          kSpacingHeight24,
          Text(
            address,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
