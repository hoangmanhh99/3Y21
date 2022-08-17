import 'dart:async';

import 'package:project3y21/data/data.dart';
import 'package:project3y21/domain/model/devices_model.dart';

import '../../domain/domain.dart';

class BaseRepositoryImpl implements BaseRepository {
  BaseApiService baseApiService = BaseApiService();

  @override
  Future<String> getSpeedCar() {
    return baseApiService.getSpeedCar();
  }

  @override
  Future<dynamic> updateSpeedCar(String speed) {
    return baseApiService.updateSpeedCar(speed);
  }

  @override
  Future<String> getColorAlert() {
    return baseApiService.getColorAlert();
  }

  @override
  Future<double> getDistanceAlert() {
    return baseApiService.getDistanceAlert();
  }

  @override
  Future updateAlertColor(String color) {
    return baseApiService.updateAlertColor(color);
  }

  @override
  Future updateDistanceAlert(double distance) {
    return baseApiService.updateDistanceAlert(distance);
  }

  @override
  Future<List<DevicesModel>> getListDevices() {
    return baseApiService.getListDevices();
  }
}
