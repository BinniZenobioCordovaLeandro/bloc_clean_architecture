import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  ThemeData? darkTheme;

  DarkTheme() {
    darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff55b849),
      primaryColorLight: const Color(0xff55b849),
      primaryColorDark: const Color(0xff55b849),
      scaffoldBackgroundColor: const Color(0xFF000000),
      backgroundColor: const Color(0xFF1C1E1D),
      iconTheme: const IconThemeData(color: Colors.grey),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFe0e0e0),
        ),
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF1C1E1D),
        elevation: 0,
        shadowColor: Color(0xFF1C1E1D),
        margin: EdgeInsets.zero,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        colorScheme: ColorScheme(
          primary: Color(0xff55b849),
          primaryVariant: Color(0xff55b849),
          secondary: Color(0xff55b849),
          secondaryVariant: Color(0xff55b849),
          surface: Color(0xff55b849),
          background: Color(0xff55b849),
          error: Color(0xff55b849),
          onPrimary: Color(0xff55b849),
          onSecondary: Color(0xff55b849),
          onSurface: Color(0xff55b849),
          onBackground: Color(0xff55b849),
          onError: Color(0xff55b849),
          brightness: Brightness.light,
        ),
        disabledColor: Color(0xff828282),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff55b849),
        splashColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
          return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          );
        }),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Size(double.infinity, 50.0);
            }
            if (states.contains(MaterialState.pressed)) {
              return const Size(double.infinity, 50.0);
            }
            return const Size(double.infinity, 50.0);
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(MaterialState.pressed)) {
            return const Color(0xff55b849);
          }
          return const Color(0xff55b849);
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return Colors.white;
          return Colors.white; // Defer to the widget's default.
        }),
      )),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
          return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          );
        }),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Size(double.infinity, 50.0);
            }
            if (states.contains(MaterialState.pressed)) {
              return const Size(double.infinity, 50.0);
            }
            return const Size(double.infinity, 50.0);
          },
        ),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromRGBO(85, 184, 73, 0.15)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xff55b849);
          }
          return const Color(0xff55b849);
        }),
      )),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color(0xff55b849), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        hintStyle: TextStyle(color: Colors.red),
        alignLabelWithHint: true,
        suffixStyle: TextStyle(color: Colors.grey),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          return const BorderSide(
            color: Color(0xff55b849),
            width: 1,
          );
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
          return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          );
        }),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Size(double.infinity, 50.0);
            }
            if (states.contains(MaterialState.pressed)) {
              return const Size(double.infinity, 50.0);
            }
            return const Size(double.infinity, 50.0);
          },
        ),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromRGBO(85, 184, 73, 0.15)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xff55b849);
          }
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xff55b849);
          }
          return const Color(0xff55b849); // Defer to the widget's default.
        }),
      )),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        headline2: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        headline3: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        headline4: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        headline5: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        headline6: TextStyle(
          color: Color(0xFFEEEEEE),
          fontFamily: 'SFProDisplay',
        ),
        subtitle1: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        subtitle2: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        bodyText1: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        bodyText2: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        button: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        caption: TextStyle(
          color: Color(0xFFBDBDBD),
          fontFamily: 'SFProDisplay',
        ),
        overline: TextStyle(
          color: Colors.white,
          fontFamily: 'SFProDisplay',
        ),
      ),
    );
  }

  get() {
    return darkTheme;
  }
}
