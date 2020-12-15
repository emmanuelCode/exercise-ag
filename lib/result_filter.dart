import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

///this class will contain the search, compare and the stats algorithm
class Filter {
  static Function unOrderDeepEquality =
      const DeepCollectionEquality.unordered().equals;

  ///algorithm for search widget //todo need optimization very slow...
  static List<String> searchListResult(
      String searchInput, List<String> wordsList) {
    return wordsList.where((element) {
      String e = (element.split('')..sort()).join('');
      String s = (searchInput.split('')..sort()).join('');

      bool test = (e == s);

      return test;
    }).toList();
  }

  static List<String> searchListResultPrototype(
      String searchInput, List<String> wordsList) {
    return wordsList
        .where(
            (element) => unOrderDeepEquality(searchInput.runes, element.runes))
        .toList();
  }

  ///algorithm for compare widget
  static bool compareResult(String compareInputOne, String compareInputTwo) {
    return unOrderDeepEquality(compareInputOne.runes, compareInputTwo.runes);
  }
}
