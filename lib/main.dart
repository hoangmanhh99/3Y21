import 'dart:io';

import 'package:auth_nav/auth_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'application.dart';
import 'data/blocs/auth/auth_bloc.dart';
import 'initialize_dependencies.dart';
import 'package:dcdg/dcdg.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: GetIt.instance.get<AuthNavigationBloc>()),
      BlocProvider.value(value: GetIt.instance.get<AuthBloc>())
    ],
    child: const Application(),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

