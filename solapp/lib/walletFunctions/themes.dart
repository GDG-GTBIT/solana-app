import 'package:flutter/material.dart';
import 'package:solapp/walletFunctions/widgets/custom_color.dart';

final lightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black87),
    useMaterial3: true,
    colorSchemeSeed: Colors.blueAccent,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    brightness: Brightness.light,
    extensions: [lightCustomColors]);

final darkTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black87),
    useMaterial3: true,
    colorSchemeSeed: Colors.blueAccent,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    brightness: Brightness.dark,
    extensions: [darkCustomColors]);
