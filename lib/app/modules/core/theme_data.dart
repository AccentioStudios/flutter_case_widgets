import 'package:flutter/material.dart';



class CustomThemeExtension {
  CustomThemeExtension._();

  static final lightTheme = ThemeData(
    fontFamily: 'ABeeZee',
    useMaterial3: true,

    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 98,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 61,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5),
      displaySmall: TextStyle(
          fontFamily: 'Baskerville', fontSize: 49, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 35,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25),
      headlineSmall: TextStyle(
          fontFamily: 'Baskerville', fontSize: 25, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 30,
          color:  Colors.white
          ),
      titleMedium: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1),
      bodyLarge: TextStyle(
          fontFamily: 'ABeeZee',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15),
      bodyMedium: TextStyle(
          fontFamily: 'ABeeZee',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25),
      labelLarge: TextStyle(
          fontFamily: 'ABeeZee',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25),
      bodySmall: TextStyle(
          fontFamily: 'ABeeZee',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4),
      labelSmall: TextStyle(
          fontFamily: 'ABeeZee',
          fontSize: 8,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5),
    ),
    //---------------- TEMA DE TEXTOS --------------------
    //textTheme: const TextTheme(
    //    bodySmall: TextStyle(
    //      color: Colors.black,
    //      fontFamily: 'ABeeZee',
    //      fontWeight: FontWeight.w800,
    //    ),
    //    headlineMedium: TextStyle(
    //      color: Colors.black,
    //    ),
    //    bodyMedium: TextStyle(
    //      color: Colors.black,
    //    ),
    //
    //
    //    bodyLarge: TextStyle(
    //        color: Colors.black,
    //        fontFamily: 'Baskerville',
    //        fontWeight: FontWeight.w900,
    //        fontSize: 22),
    //    displayLarge: TextStyle(color: Colors.black),
    //    displaySmall: TextStyle(
    //      color: Colors.black,
    //      fontFamily: 'Baskerville',
    //      fontWeight: FontWeight.w100,
    //
    //    )),
    //// -----------------TEMA DE ICONES ----------------------
    iconTheme: const IconThemeData(color: Colors.white, size: 30),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: MaterialStatePropertyAll(25),
        iconColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),

    

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
          backgroundColor: Colors.black),
    ),
    // textTheme: extTextTheme,
    scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const MaterialStatePropertyAll(true),
        thumbColor: MaterialStateColor.resolveWith((states) => Colors.black45)),
  
    
    colorScheme:  ColorScheme(
      brightness: Brightness.light,
      primary: Colors.grey.shade700,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
