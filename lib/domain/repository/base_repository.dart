import 'dart:async';

import '../model/devices_model.dart';

abstract class BaseRepository {
  Future<String> getSpeedCar();
  Future<dynamic> updateSpeedCar(String speed);
  Future<String> getColorAlert();
  Future<dynamic> updateAlertColor(String color);
  Future<double> getDistanceAlert();
  Future<dynamic> updateDistanceAlert(double distance);
  Future<List<DevicesModel>> getListDevices();
}