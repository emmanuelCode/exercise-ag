import 'package:collection/collection.dart';

///this class will contain the search, compare and the stats algorithm
class Filter {
  static Function _unOrderDeepEquality =
      const DeepCollectionEquality.unordered().equals;

  ///algorithm for search widget PROTOTYPE //todo need optimization very slow...
  // static List<String> searchListResult(
  //     String searchInput, List<String> wordsList) {
  //   return wordsList.where((element) {
  //     String e = (element.split('')..sort()).join('');
  //     String s = (searchInput.split('')..sort()).join('');
  //
  //     bool test = (e == s);
  //
  //     return test;
  //   }).toList();
  // }

  ///algorithm for search widget PROTOTYPE TWO
  // static List<String> searchListResultPrototype(
  //     String searchInput, List<String> wordsList) {
  //   return wordsList
  //       .where(
  //           (element) => _unOrderDeepEquality(searchInput.runes, element.runes))
  //       .toList();
  // }

  ///algorithm for search widget OPTIMIZED //still a bit laggy
  static List<String> searchListResult(
      MapEntry<String, List<String>> searchInputAndWordList) {
    String searchInput = searchInputAndWordList.key;
    List<String> wordsList = searchInputAndWordList.value;

    return wordsList
        .where(
            (element) => _unOrderDeepEquality(searchInput.runes, element.runes))
        .toList();
  }

  ///algorithm for compare widget
  static bool compareResult(String compareInputOne, String compareInputTwo) {
    return _unOrderDeepEquality(compareInputOne.runes, compareInputTwo.runes);
  }
}
