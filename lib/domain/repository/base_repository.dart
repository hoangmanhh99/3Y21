abstract class BaseRepository {
  Future<String> getSpeedCar();
  Future<dynamic> updateSpeedCar(String speed);
}