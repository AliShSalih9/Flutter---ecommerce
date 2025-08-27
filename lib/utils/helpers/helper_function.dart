import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DHelperFunction {
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'cyan':
        return Colors.cyan;
      case 'lime':
        return Colors.lime;
      case 'indigo':
        return Colors.indigo;
      case 'teal':
        return Colors.teal;
      case 'amber':
        return Colors.amber;
      case 'deeporange':
      case 'deep_orange':
        return Colors.deepOrange;
      case 'lightblue':
      case 'light_blue':
        return Colors.lightBlue;
      case 'lightgreen':
      case 'light_green':
        return Colors.lightGreen;
      case 'bluegrey':
      case 'blue_grey':
        return Colors.blueGrey;
      case 'deeppurple':
      case 'deep_purple':
        return Colors.deepPurple;
      case 'transparent':
        return Colors.transparent;
      default:
        return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }

  static String turncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size getScreenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static getFomattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // ignore: non_constant_identifier_names
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < wrappedList.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));

    }
    return wrappedList;
  }
  
}

