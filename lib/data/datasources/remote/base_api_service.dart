import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' as developer;

final client = Supabase.instance.client;

class BaseApiService {
  Dio dio = GetIt.instance.get();

  Future<String> getSpeedCar() async {
    try {
      final response = await client.from("settings").select("speed").execute();
      return (response.data as List<dynamic>)[0]['speed'];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateSpeedCar(String speed) async {
    try {
      final response = await client
          .from("settings")
          .update({"speed": speed})
          .eq("id", 1)
          .execute();
      developer.log('${response.data} ${response.error}', name: '');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Future<String> getSpeedCar() async {
  //   try {
  //     final response = await client.from("settings").select("speed").execute();
  //     return (response.data as List<dynamic>)[0]['speed'];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
