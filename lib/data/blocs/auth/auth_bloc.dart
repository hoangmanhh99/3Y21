import 'package:auth_nav/auth_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:developer' as developer;

import '../../../utils/utils.dart';
import '../../data.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthNavigationBloc authNavigationBloc = GetIt.instance.get();

  final AuthRepository _authRepository = GetIt.instance.get();

  IO.Socket? socket;

  Stream? streamSocket;

  AuthBloc() : super(const AuthState.unAuthorized()) {
    GetIt.instance
        .get<Oauth2Manager<AuthenticationDto>>()
        .controller
        .stream
        .listen((event) {
      if (event != null) {
        authNavigationBloc.emit(AuthNavigationState.authorized());
      } else {
        authNavigationBloc.emit(AuthNavigationState.unAuthorized());
      }
    });
  }

  //Call on splash screen
  Future initializeApp() async {
    final profile = await _authRepository.profile();
    developer.log('ServerAddress ${SharedPreferencesUtils.getData(NetworkConstants.addressServer)}');
    socket = IO.io(
        SharedPreferencesUtils.getData(NetworkConstants.addressServer),
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .build());
    await connectSocket();
    emit(AuthState.authorized(profile));
  }

  Future login(String username, String password) async {
    final auth = await _authRepository.login(username, password);
    final profile = await _authRepository.profile();
    developer.log('ServerAddress ${SharedPreferencesUtils.getData(NetworkConstants.addressServer)}');
    socket = IO.io(
        SharedPreferencesUtils.getData(NetworkConstants.addressServer),
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .build());
    await connectSocket();
    GetIt.instance.get<Oauth2Manager<AuthenticationDto>>().add(auth);
  }

  Future logout() async {
    await _authRepository.logout();
    socket?.disconnect();
    GetIt.instance.get<Oauth2Manager<AuthenticationDto>>().add(null);
  }

  Future connectSocket() async {
    // IO.Socket socket = IO.io(
    //     SharedPreferencesUtils.getData(NetworkConstants.addressServer),
    //     IO.OptionBuilder()
    //         .setTransports(['websocket'])
    //         .enableForceNew()
    //         .build());
    developer.log('connecting', name: '');

    socket?.onConnect((data) {
      developer.log('Connection established');
      Fluttertoast.showToast(
          msg: 'Connection established', gravity: ToastGravity.CENTER);
    });
    socket?.on("led", (data) {
      developer.log('ConnectionLedLog ${data}');
    });
    socket?.onConnectError((data) {
      developer.log('Connect Error: $data');
      Fluttertoast.showToast(
          msg: 'Connect Error', gravity: ToastGravity.CENTER);
    });
    socket?.onDisconnect((data) {
      developer.log('Socket server disconnected');
      Fluttertoast.showToast(
          msg: 'Socket server disconnected', gravity: ToastGravity.CENTER);
    });
  }
}
