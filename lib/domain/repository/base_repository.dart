import 'dart:async';

abstract class BaseRepository {
  Future<String> getSpeedCar();
  Future<dynamic> updateSpeedCar(String speed);
  Future<String> getColorAlert();
  Future<dynamic> updateAlertColor(String color);
  Future<double?> getDistanceAlert();
  Future<dynamic> updateDistanceAlert(double distance);
}