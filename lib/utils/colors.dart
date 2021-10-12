import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static Shader mainColor = LinearGradient(
    colors: <Color>[
      Color(0xffff4800),
      Color(0xffffa300),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  static LinearGradient gradientColor = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xffff4800),
      Color(0xffffa300),
    ],
  );
  static const Color primaryColor = Color(0xFFFF4800);
  static const Color neutral3Color = Color(0xFFDADADA);
  static const Color primaryColorBlue = Color(0xff0063f7);
  static const Color primaryColorBlueHover = Color(0xff8ab3ff);
  static const Color primaryColorBluePress = Color(0xffD6E3FF);
  static const Color primaryColorGreen = Color(0xFF36BF7F);
  static const Color primaryColorRed = Colors.red;
  static const Color primaryColorOrange = Colors.orange;
  static const Color primaryColorYellow = Color(0xFFF4D323);
  static const Color primaryColorGray = Color(0xFFA7B4BF);

  static const Color textColor1 = Color(0xFF202020);
  static const Color textColor2 = Color(0xFFA7B4BF);
  static const Color textColor3 = Color(0xFFABA8A8);

  static const Color contentColor = Color(0xFFA7B4BF);

  static const Color hintColor = Color(0xffa7b4bf);
  static const Color secondMainColor = Color(0xffffdede);

  static const Color borderColor = Color(0xFF8D93A5);
  static const Color borderColorFocus = Color(0xFF2C67DD);
  static const Color borderColorError = Color(0xFFEF5A43);
  static const Color grey3 = Color(0xFF8D93A5);
  static const Color grey5 = Color(0xFFF4F4F6);

  static const Color secondaryGrey1 = Color(0xFF363A45);
  static const Color grey2 = Color(0xFF5A6072);
  static const Color divider = Color(0xFFF4F4F6);
  static const List<Color> colorChart = [
    Color(0xff00bdae),
    Color(0xffa9aa5f),
    Color(0xff357cd2),
    Color(0xffe56590),
    Color(0xfff8b883),
    Color(0xff70ad47),
    Color(0xffdd8abd),
    Color(0xff7f84e8),
    Color(0xff7bb4eb),
    Color(0xffea7a57)
  ];

  static const List<Color> ordinalNumberBackground = [
    Color(0xffBDBDBD),
    Color(0xff2D9CDB),
    Color(0xffF2C94C),
    Color(0xffFF0000),
    Color(0xff946032),
    Color(0xff329485),
    Color(0xff8d9432),
    Color(0xff324b94),
    Color(0xff603294),
    Color(0xff943292),
    Color(0xffaca5cb),
    Color(0xffbf9090),
    Color(0xff92b8a1),
    Color(0xffaad0a9),
    Color(0xff9dc49e),
  ];

  static const Color whiteBackgroundColor = Color(0xffF0F2F6);
  static const Color outlineColor = Color(0xffD9D9D9);
  static const Color textPrimaryColor = Color(0xff100F0F);
  static const Color textSecondaryColor = Color(0xff555555);

  static const Color hintColor1 = Color(0xffaba8a8);
}
