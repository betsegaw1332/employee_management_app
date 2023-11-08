import 'package:intl/intl.dart';

abstract class AppHelperFunctions {
  static String formatDate({required DateTime dateTime}) {
    final fomater = DateFormat('d MMM yyyy');

    return fomater.format(dateTime);
  }

  static String? validateTextField(String? inputText) {
    return inputText!.isNotEmpty ? null : "Field can not be empty";
  }
}
