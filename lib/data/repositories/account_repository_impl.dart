import 'package:oauth2_dio/oauth2_manager.dart';

import '../../domain/repository/account_repository.dart';
import '../datasources/remote/account_api_service.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountApiService accountApiService = AccountApiService();

  @override
  Future changePassword(
      {String? phone,
      String? newPassword,
      String? reNewPassword,
      String? otp}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<String> forgotPassword({String? phone}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<OAuthInfoMixin> login({String? phone, String? password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future reSendOtp({String? phone}) {
    // TODO: implement reSendOtp
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({String? phone, String? password, String? name}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  // @override
  // Future<String> updateCustomer(
  //     {String? code,
  //     String? name,
  //     String? sex,
  //     String? email,
  //     String? phoneNumber,
  //     String? dob}) async {
  //   String isSucess = await accountApiService.updateCustomer(
  //     code: code,
  //     name: name,
  //     sex: sex,
  //     email: email,
  //     phoneNumber: phoneNumber,
  //     dob: dob,
  //   );
  //   return isSucess;
  // }
}
