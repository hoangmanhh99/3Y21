import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:project3y21/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../data/data.dart';
import '../../../utils/colors.dart';
import '../../../utils/share_preference_utils.dart';
import 'dart:developer' as developer;

import '../../../widgets/widgets.dart';

// final client = Supabase.instance.client;

class SignInOldPage extends StatefulWidget {
  const SignInOldPage({Key? key}) : super(key: key);

  @override
  _SignInOldPageState createState() => _SignInOldPageState();
}

class _SignInOldPageState extends State<SignInOldPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _ipAddressController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  String _connectionStatus = 'Unknown';
  String _ssidWifi = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final NetworkInfo _networkInfo = NetworkInfo();

  bool isBtnActive = true;
  bool myAutoValidate = false;
  isTextFieldEmpty() {
    if (_ipAddressController.text.isNotEmpty &&
        _portController.text.isNotEmpty) {
      setState(() {
        isBtnActive = true;
      });
    } else {
      setState(() {
        isBtnActive = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      _determinePosition();
    }
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _portController.text = "3000";
    _ipAddressController.text = "192.168.";

    // _ipAddressController.addListener(() {
    //   isTextFieldEmpty();
    // });
    // _portController.addListener(() {
    //   isTextFieldEmpty();
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      DialogProvider.showErrorDialog(context,
          'Dịch vụ vị trí đang tắt. Bạn cần bật định vị để xác thực hình ảnh!',
              () async {
            await Geolocator.openLocationSettings().then((value) async {
              if (value) {
                await initConnectivity();
              }
            });
          });

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        DialogProvider.showDialogNormal(
            'Bạn cần phải vào phần Cài đặt để chỉnh lại quyền truy cập vị trí.',
            context,
            'Huỷ',
            'Đi tới cài đặt', () async {
          await Geolocator.openAppSettings().then((value) async {
            if (value) {
              await initConnectivity();
            }
          });
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      DialogProvider.showDialogNormal(
          'Bạn cần phải vào phần Cài đặt để chỉnh lại quyền truy cập vị trí.',
          context,
          'Huỷ',
          'Đi tới cài đặt', () async {
        await Geolocator.openAppSettings();
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Please connect to your Server!',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        foreground: Paint()..shader = ColorConstants.mainColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Wifi status: $_connectionStatus',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  Text('SSID: $_ssidWifi',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 136,
                    child: MyElevatedButton(
                      "Reload Page",
                      onPressed: () async {
                        await initConnectivity();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('IP ADDRESS',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: ColorConstants.hintColor1)),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _ipAddressController,
                          hintText: "Type ip address",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input ip address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('PORT',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: ColorConstants.hintColor1)),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _portController,
                          hintText: "Type port",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please input port';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ],
                    ),
                  ),
                  kSpacingHeight24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyElevatedButton("CONNECT WITH HEROKU",
                        onPressed: (!isBtnActive)
                            ? null
                            : () async {
                          // if (_formKey.currentState!.validate()) {
                          SharedPreferencesUtils.setData(
                              NetworkConstants.addressServer,
                              'https://arduino-socket-app.herokuapp.com');
                          await context
                              .read<AuthBloc>()
                              .login("username", "password");
                          // await client.auth.signIn(
                          //     email: "manhhv.agiletech@gmail.com").then((value) {
                          //       developer.log('SignInSupabase ${value.?.toJson()}', name: '');
                          // });
                          // }
                        }),
                  ),
                  kSpacingHeight24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyElevatedButton("CONNECT WITH LOCAL",
                        onPressed: (!isBtnActive)
                            ? null
                            : () async {
                          if (_formKey.currentState!.validate()) {
                            SharedPreferencesUtils.setData(
                                NetworkConstants.addressServer,
                                'http://${_ipAddressController.text}:${_portController.text}');
                            context
                                .read<AuthBloc>()
                                .login("username", "password");
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    // _wifiInfo.requestLocationServiceAuthorization();
    switch (result) {
      case ConnectivityResult.wifi:
        String? wifiName, wifiBSSID, wifiIP;

        try {
          if (!kIsWeb && Platform.isIOS) {
            LocationAuthorizationStatus status =
            await _networkInfo.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status = await _networkInfo.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiName = await _networkInfo.getWifiName();
            } else {
              wifiName = await _networkInfo.getWifiName();
            }
          } else {
            wifiName = await _networkInfo.getWifiName();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiName = "Failed to get Wifi Name";
        }

        try {
          if (!kIsWeb && Platform.isIOS) {
            LocationAuthorizationStatus status =
            await _networkInfo.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status = await _networkInfo.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiBSSID = await _networkInfo.getWifiBSSID();
            } else {
              wifiBSSID = await _networkInfo.getWifiBSSID();
            }
          } else {
            wifiBSSID = await _networkInfo.getWifiBSSID();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiBSSID = "Failed to get Wifi BSSID";
        }

        try {
          wifiIP = await _networkInfo.getWifiIP();
        } on PlatformException catch (e) {
          print(e.toString());
          wifiIP = "Failed to get Wifi IP";
        }

        setState(() {
          _connectionStatus = 'Connected';
          _ssidWifi = "$wifiName \n $wifiIP \n $wifiName";
          NetworkConstants.ipAddress = wifiIP ?? "";
          developer
              .log('NetworkConstants.ipAddress ${NetworkConstants.ipAddress}');
        });
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString(NetworkConstants.ipAddress, wifiIP ?? "");
        break;
      default:
        setState(() {
          _connectionStatus = 'Please connect your device to wifi';
          _ssidWifi = 'None';
        });
        break;
    }
  }
}
