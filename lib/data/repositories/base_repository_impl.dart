import 'package:project3y21/data/data.dart';

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
}
