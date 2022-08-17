import '../../data.dart';
import 'dart:developer' as developer;

class AuthApiService extends BaseApiService {
  Future<ProfileDto> profile() async {
    return ProfileDto('abc');
  }

  Future logout() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthenticationDto> signUp(String email, String password) async {
    try {
      final response = await client.auth.signUp(email, password);
      final user = response.data?.user;
      developer.log(
          "SignUpLog ${response.data?.user} ${response.data?.accessToken} ${response.data?.refreshToken}");
      return AuthenticationDto(
          response.data?.accessToken ?? "", response.data?.refreshToken ?? "");
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthenticationDto> login(String email, String password) async {
    final response = await client.auth.signIn(email: email, password: password);
    final user = response.data?.user;
    final error = response.error;
    developer.log(
        "SignUpLog ${response.data?.accessToken} ${response.data?.refreshToken}");
    if (error == null) {
      return AuthenticationDto(
          response.data?.accessToken ?? "", response.data?.refreshToken ?? "");
    } else {
      developer.log('${response.error}');
      return AuthenticationDto(
          response.data?.accessToken ?? "", response.data?.refreshToken ?? "");
    }
  }
}
