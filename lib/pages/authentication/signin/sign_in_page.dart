import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/data/blocs/auth/auth.dart';
import 'package:flutter_application/utils/colors.dart';
import 'package:flutter_application/widgets/design_system/formfield/formfield.dart';
import 'package:flutter_application/widgets/my_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _ipAddressController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  bool isBtnActive = false;
  bool myAutoValidate = false;
  isTextFieldEmpty() {
    if (_ipAddressController.text.isNotEmpty &&
        _portController.text.isNotEmpty) {
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
    _ipAddressController.addListener(() {
      isTextFieldEmpty();
    });
    _portController.addListener(() {
      isTextFieldEmpty();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Please connect to your arduino device!',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      foreground: Paint()..shader = ColorConstants.mainColor
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Wifi status:',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text('SSID:', style: Theme.of(context).textTheme.headline3),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('IP ADDRESS',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: ColorConstants.hintColor1
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _ipAddressController,
                          hintText: "Type ip address",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input ip address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('PORT',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ColorConstants.hintColor1
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextFormField1(
                          controller: _portController,
                          hintText: "Type port",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny('')
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input port';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyElevatedButton("CONNECT",
                        onPressed: (!isBtnActive)
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .login("username", "password");
                                }
                              }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
