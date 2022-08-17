import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/data.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  static const path = "SignUpPage";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool isBtnActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.headline2,
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
                        inputFormatters: [FilteringTextInputFormatter.deny('')],
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
                        inputFormatters: [FilteringTextInputFormatter.deny('')],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('Confirm Password',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: ColorConstants.hintColor1)),
                      const SizedBox(
                        height: 8,
                      ),
                      MyTextFormField1(
                        controller: _confirmPassController,
                        hintText: "Type confirm password",
                        obscureText: false,
                        inputFormatters: [FilteringTextInputFormatter.deny('')],
                      ),
                    ],
                  ),
                ),
                kSpacingHeight24,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MyElevatedButton("Sign Up",
                      onPressed: (!isBtnActive)
                          ? null
                          : () async {
                              await context.runTask(context.read<AuthBloc>().signUp(
                                  _emailController.text,
                                  _passwordController.text).then((value) {
                                    Fluttertoast.showToast(msg: "Successful Sign Up");
                                    Navigator.pop(context);
                              }));
                            }),
                ),
                kSpacingHeight24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
