import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:project3y21/pages/authentication/sign_up/sign_up_page.dart';
import 'package:project3y21/utils/app_constants.dart';
import 'package:project3y21/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../data/data.dart';
import '../../../utils/colors.dart';
import '../../../utils/share_preference_utils.dart';
import 'dart:developer' as developer;

import '../../../widgets/widgets.dart';

// final client = Supabase.instance.client;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isBtnActive = true;
  bool myAutoValidate = false;
  isTextFieldEmpty() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        isBtnActive = true;
      });
    } else {
      setState(() {
        isBtnActive = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Please connect to 3Y21!',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        foreground: Paint()..shader = ColorConstants.mainColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: ColorConstants.hintColor1)),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _emailController,
                          hintText: "Type email address",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input email address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Password',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: ColorConstants.hintColor1)),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _passwordController,
                          hintText: "Type password",
                          isPassword: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please input port';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ],
                    ),
                  ),
                  kSpacingHeight24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyElevatedButton("Sign In",
                        onPressed: (!isBtnActive)
                            ? null
                            : () async {
                                await context.runTask(context
                                    .read<AuthBloc>()
                                    .login(_emailController.text,
                                        _passwordController.text)
                                    .onError((error, stackTrace) {
                                  Fluttertoast.showToast(msg: "Wrong password");
                                }));
                              }),
                  ),
                  kSpacingHeight24,
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpPage.path);
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.blue),
                      )),
                  kSpacingHeight24,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
