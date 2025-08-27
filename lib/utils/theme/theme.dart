import 'package:ecommerce/utils/constant/colors.dart';
import 'package:ecommerce/utils/theme/custome_themes/AppbarTheme.dart';
import 'package:ecommerce/utils/theme/custome_themes/botoomSheet_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/checkBox_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/chip_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/elevatedbutton_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/outlined_button_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/text_field_theme.dart';
import 'package:ecommerce/utils/theme/custome_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DAppTheme {
  DAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: DColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: DTextTheme.lightTextTheme,
    elevatedButtonTheme: DElevatedbutton_theme.lightEvelatedButtonTheme,
    appBarTheme: DAppbartheme.lightAppBarTheme,
    bottomSheetTheme: DBotoomsheetTheme.lightBottomSheetTheme,
    checkboxTheme: DCheckboxTheme.lightCheckBoxTheme,
    chipTheme: DChipTheme.lightChipTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: DTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: DColors.primaryColor,
    textTheme: DTextTheme.darkTextTheme,
    elevatedButtonTheme: DElevatedbutton_theme.darkElevatedButtonTheme,
    appBarTheme: DAppbartheme.darkAppBarTheme,
    bottomSheetTheme: DBotoomsheetTheme.darkBottomSheetTheme,
    checkboxTheme: DCheckboxTheme.darkCheckBoxTheme,
    chipTheme: DChipTheme.darkChipTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: DTextFieldTheme.darkInputDecorationTheme,
  );
}
