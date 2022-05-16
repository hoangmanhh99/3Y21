import '../../data.dart';

class AuthApiService extends BaseApiService {
  Future<AuthenticationDto> login(String userName, String passWord) async {
    return AuthenticationDto('abc', 'def');
  }

  Future<ProfileDto> profile() async {
    return ProfileDto('abc');
  }

  Future logout() async {}
}
