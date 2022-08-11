import 'package:flutter/cupertino.dart';
import 'package:oauth2_dio/oauth2_dio.dart';

abstract class AccountRepository {
  Future<OAuthInfoMixin> login({String phone, String password});

  Future<String> signUp({String phone, String password, String name});

  Future<String> forgotPassword({String phone});

  Future<dynamic> changePassword(
      {String phone, String newPassword, String reNewPassword, String otp});

  Future<dynamic> reSendOtp({String phone});

  // Future<String> updateCustomer(
  //     {String? code,
  //     String? name,
  //     String? sex,
  //     String? email,
  //     String? phoneNumber,
  //     String? dob});
}
