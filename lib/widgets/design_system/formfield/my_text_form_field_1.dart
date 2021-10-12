import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField1 extends FormField<String> {
  final bool obscureText;
  MyTextFormField1({
    String? value,
    TextEditingController? controller,
    Key? key,
    String? initialValue,
    String? hintText,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    Widget? suffix,
    Widget? icon,
    Widget? prefix,
    bool filled = false,
    AutovalidateMode? autovalidateMode,
    this.obscureText = true,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    onTap,
    bool myAutoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String>? onChanged,
    int? minLines,
  }) : super(
            key: key,
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            autovalidateMode: alwaysValidate
                ? AutovalidateMode.always
                : myAutoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
            builder: (FormFieldState state) {
              MyTextFormField1State field1state = state as MyTextFormField1State ;
              return TextField(
                minLines: minLines ?? 1,
                maxLines: maxLine ?? 1,
                cursorColor: Colors.black,
                controller: controller,
                obscureText: isPassword ? field1state._obscureText : false,
                style: Theme.of(state.context).textTheme.bodyText1,
                keyboardType: inputType,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
                onChanged: (text) {
                  state.didChange(text);
                  if (onChanged != null) {
                    onChanged(text);
                  }
                },
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(state.context).inputDecorationTheme)
                    .copyWith(
                      hintText: hintText ?? '',
                      suffixIcon: isPassword
                          ? InkResponse(
                              child: Icon(
                                  obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xffc4c4c4)),
                              onTap: () {
                                field1state.onChangeObscureText();
                              },
                            )
                          : null,
                      errorText: state.errorText,
                      enabled: enabled,
                    ),
              );
            });
  @override
  MyTextFormField1State createState() => MyTextFormField1State();
}

class MyTextFormField1State extends FormFieldState<String> {
  late bool _obscureText;

  void onChangeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  MyTextFormField1 get widget => super.widget as MyTextFormField1;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }
}
