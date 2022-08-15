import 'dart:async';

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

  Future<String> getColorAlert() async {
    try {
      final response =
          await client.from("settings").select("alert_color").execute();
      return (response.data as List<dynamic>)[0]['alert_color'] ?? "FF0000";
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateAlertColor(String color) async {
    try {
      final response = await client
          .from("settings")
          .update({"alert_color": color})
          .eq("id", 1)
          .execute();
      developer.log('${response.data} ${response.error}', name: '');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<double?> getDistanceAlert() async {
    try {
      final response =
          await client.from("settings").select("distance_alert").execute();
      return double.tryParse(
              (response.data as List<dynamic>)[0]['distance_alert'].toString()) ??
          20.0;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateDistanceAlert(double distance) async {
    try {
      final response = await client
          .from("settings")
          .update({"distance_alert": distance})
          .eq("id", 1)
          .execute();
      developer.log('${response.data} ${response.error}', name: '');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
