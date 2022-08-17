import '../data.dart';

class AuthRepository {
  AuthApiService authApiService = AuthApiService();

  Future<AuthenticationDto> login(String email, String password) {
    return authApiService.login(email, password);
  }

  Future logout() {
    return authApiService.logout();
  }

  Future<ProfileDto> profile() {
    return authApiService.profile();
  }

  Future<AuthenticationDto> signUp(String email, password) {
    return authApiService.signUp(email, password);
  }
}
