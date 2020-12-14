import 'package:flutter/cupertino.dart';

/// using provider this class will keep track of search entry
/// and update the views to show the result
/// I will also load the word list with it's constructor
class AnagramNotifier with ChangeNotifier {
  String searchInput;
  String compareInputOne;
  String compareInputTwo;
  String wordText;
  List<String> anagramWords;

  AnagramNotifier(this.wordText) {
    anagramWords = wordText.split('\n');

    // Debug...
    // print(anagramWords[1]);
    // print(anagramWords.length);
  }

  updateSearchInput(String value) {
    searchInput = value;
    notifyListeners();
  }

  updateCompareInputOne(String value) {
    compareInputOne = value;
    notifyListeners();
  }

  updateCompareInputTwo(String value) {
    compareInputTwo = value;
    notifyListeners();
  }
}
