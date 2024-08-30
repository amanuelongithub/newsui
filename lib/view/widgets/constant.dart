import 'dart:ui';
import 'package:intl/intl.dart';

class AppConstants {
  static Color kcPrimary =const Color.fromARGB(255, 71, 90, 215); // app color
  static Color kcSecondary =const Color.fromARGB(113, 136, 136, 136); // app color
  }
  getDate(DateTime date) {
    return DateFormat("MMM d, yyyy").format(date);
  }