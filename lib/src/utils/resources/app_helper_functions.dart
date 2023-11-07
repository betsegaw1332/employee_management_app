import 'package:intl/intl.dart';

abstract class AppHelperFunctions{
  static String formatDate({required DateTime dateTime}){
    final fomater= DateFormat('d MMM yyyy');

    return fomater.format(dateTime);
  }
}