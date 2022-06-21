import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:project3y21/utils/app_constants.dart';
import '../../../data/data.dart';
import '../../../utils/colors.dart';
import '../../../utils/share_preference_utils.dart';
import '../../../widgets/design_system/formfield/formfield.dart';
import '../../../widgets/my_elevated_button.dart';
import 'dart:developer' as dev;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
                    'Please connect to your arduino device!',
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
                    height: 60,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input port';
                            } else {
                              return null;
                            }
                          },
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
                                  context
                                      .read<AuthBloc>()
                                      .login("username", "password");
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
                                // if (_formKey.currentState!.validate()) {
                                  SharedPreferencesUtils.setData(
                                      NetworkConstants.addressServer,
                                      'http://192.168.1.12:3000');
                                  context
                                      .read<AuthBloc>()
                                      .login("username", "password");
                                // }
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
          _ssidWifi = "$wifiBSSID \n $wifiIP \n $wifiName";
          NetworkConstants.ipAddress = wifiIP ?? "";
          dev.log('NetworkConstants.ipAddress ${NetworkConstants.ipAddress}');
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
