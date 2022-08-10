import 'dart:io';

import 'package:auth_nav/auth_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'application.dart';
import 'data/blocs/auth/auth_bloc.dart';
import 'initialize_dependencies.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://udfkxbgpzkzjjvcqqtmv.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmt4Ymdwemt6amp2Y3FxdG12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTM1MzA1OTYsImV4cCI6MTk2OTEwNjU5Nn0.UmYSSoiZ0krNU0tWPr47UUZRtD5uIYpaVbLyn5Lc6oo',
      debug: true);
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
