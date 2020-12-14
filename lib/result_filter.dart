import 'package:flutter/foundation.dart';

///this class will contain the search, compare and the stats algorithm
class Filter {
  ///algorithm for search widget //todo need optimization very slow...
  static List<String> searchListResult(String search, List<String> wordsList) {
    return wordsList.where((element) {
      String e = (element.split('')..sort()).join('');
      String s = (search.split('')..sort()).join('');

      bool test = (e == s);

      return test;
    }).toList();
  }
}
