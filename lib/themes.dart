import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/ui_constants.dart';

ThemeData light(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      accentColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white)
      ),
      accentColorBrightness: Brightness.dark,
      toggleableActiveColor: Colors.red,
      bottomAppBarColor: Colors.white,
      primaryColorBrightness: Brightness.light,
      primaryColorDark: Colors.black87,
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      cardColor: Colors.white,
      backgroundColor: Colors.grey[200],
      dialogBackgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(onPrimary: Colors.black),
      sliderTheme: SliderTheme.of(context).copyWith(
        activeTrackColor: const Color(0xff3f414e),
        inactiveTrackColor: const Color(0xffa0a3b1),
        trackHeight: 0.5,
        thumbColor: const Color(0xff3f414e),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayColor: Colors.purple.withAlpha(32),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
      ),
      cardTheme: CardTheme(
          elevation: 5,
          margin: const EdgeInsets.all(0),
          shadowColor: const Color(0xffe5e5e5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIConstants.borderRadius_12),
          ),
          color: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.orange),
          centerTitle: true,
          elevation: 0
      ),
      textTheme: TextTheme(
          button: ThemeData.light().textTheme.button!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplaySemiBold'
            // da dung
          ),
          caption: ThemeData.light().textTheme.caption!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'SFProDisplaySemiBold'
          ),
          headline6: ThemeData.light().textTheme.headline6!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 20,
              fontFamily: 'SFProDisplaySemiBold'
            //used
          ),
          headline5: ThemeData.light().textTheme.headline5!.copyWith(
              color: ColorConstants.textColor1,              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplaySemiBold'
            //used
          ),
          headline4: ThemeData.light().textTheme.headline4!.copyWith(
              color: ColorConstants.textColor1,              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplaySemiBold'
          ),
          headline3: ThemeData.light().textTheme.headline3!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 26,
              fontWeight: FontWeight.bold, fontFamily: 'SFProDisplaySemiBold'

          ),
          headline2: ThemeData.light().textTheme.headline2!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplaySemiBold'
          ),
          headline1: ThemeData.light().textTheme.headline1!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplaySemiBold'
          ),
          subtitle1: ThemeData.light().textTheme.subtitle1!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 15,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProDisplaySemiBold'
            //da dung
          ),
          subtitle2: ThemeData.light().textTheme.subtitle2!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProDisplaySemiBold'
          ),
          bodyText2: ThemeData.light()
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 14, color: ColorConstants.textColor1,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProDisplaySemiBold'),
          bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
              color: ColorConstants.textColor1,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProDisplaySemiBold')
      ),
      dividerTheme: const DividerThemeData(
          thickness: 2,
          color: Color(0xffeceef0)
      ),

      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(color: Colors.transparent),
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.normal,
            color: const Color(0xffd3d9df)
        ),
        labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
          borderSide: const BorderSide(color: Color(0xffe8e8e8), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
          borderSide: const BorderSide(color: Color(0xffe8e8e8), width: 1),
        ),
        focusedBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
          borderSide: const BorderSide(color: Colors.orange, width: 1),
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
          borderSide: const BorderSide(color: Color(0xffe8e8e8), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIConstants.borderRadius_8),
                side: const BorderSide(color: Colors.transparent)),
            primary: Colors.transparent,
            elevation: 0),),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 56),
              side: const BorderSide(color: Colors.transparent),
              primary: Colors.transparent
          ))
  );
}

ThemeData dark(BuildContext context) {
  return ThemeData.dark();
}
