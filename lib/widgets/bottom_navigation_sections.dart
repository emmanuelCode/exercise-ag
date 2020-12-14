import 'package:exercise_ag/anagram_notifier.dart';
import 'package:exercise_ag/info_board.dart';
import 'package:exercise_ag/result_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// the search widget for finding all anagrams
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //get our update search method to notify when input is changing
    var updateInput = context
        .select<AnagramNotifier, dynamic>((value) => value.updateSearchInput);

    String searchText = context.watch<AnagramNotifier>().searchInput;
    List<String> anagramWords = context.watch<AnagramNotifier>().anagramWords;

    return Column(
      children: [
        Container(
          //search container
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                searchTextField(updateInput),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        searchText.isNotEmpty
            ? Expanded(
                /// search list anagram
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 14.0),
                  child: ListView.separated(
                    //test widget
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(Filter.searchListResult(
                          searchText, anagramWords)[index]), //Todo To change
                    ), //item widget
                    separatorBuilder: (_, index) => Divider(
                      color: Colors.grey,
                      indent: 7.0,
                      endIndent: 7.0,
                    ),
                    itemCount: Filter.searchListResult(searchText, anagramWords)
                        .length, //todo : to change
                  ),
                ),
              )
            : Container(
                //if search text tenary operator...
                //TODO: to change when having result...
                //explanation container
                color: Colors.white,
                margin: EdgeInsets.only(top: 14.0),
                child: InfoBoard.searchExplanation(),
              ),
      ],
    );
  }
}

/// the compare widget...
class Compare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //get access to our anagram_notifier methods
    var updateInputOne = context.select<AnagramNotifier, dynamic>(
        (value) => value.updateCompareInputOne);
    var updateInputTwo = context.select<AnagramNotifier, dynamic>(
        (value) => value.updateCompareInputTwo);

    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      compareTextField('Word 1', updateInputOne),
                      SizedBox(height: 16),
                      compareTextField('Word 2', updateInputTwo),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.compare_arrows),
                )
              ],
            ),
          ),
        ),
        Container(
          //TODO: to change when having result...
          //explanation container
          color: Colors.white,
          margin: EdgeInsets.only(top: 14.0),
          child: InfoBoard.compareExplanation(),
        ),
      ],
    );
  }
}

/// the stats widget
class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          //TODO: to change when having result...
          //explanation container
          color: Colors.white,
          //margin: EdgeInsets.only(top: 14.0),
          child: InfoBoard.StatsAnagram('Longest Anagram',
              'placeholder: sjlfjalsjlsjkflksj fjsljfslj\nsljflsjsjsjlsjs'),
        ),
        Container(
          //TODO: to change when having result...
          //explanation container
          color: Colors.white,
          margin: EdgeInsets.only(top: 14.0),
          child: InfoBoard.StatsAnagram('Most Anagram',
              'placeholder: apple, pear, kiwi, banana, pineapple, peach, apricot, strawberry'),
        ),
      ],
    );
  }
}

/// HELPER WIDGETS FOR TEXT FIELDS ///

/// a stylize text field for the search field
Widget searchTextField(dynamic updateText) {
  return Expanded(
    //textField need expanded (for rendering error)
    child: TextField(
      onChanged: (value) {
        updateText(value);
        //try with the contains widget
        print('entered Text: $value');
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        labelText: 'Word',
      ),
    ),
  );
}

/// a stylize text field that take in a hint
/// it is created to avoid repetition in code
/// and shrink codebase.
Widget compareTextField(String hint, dynamic updateText) {
  return TextField(
    onChanged: (value) {
      updateText(value);

      //debug
      // print(context.read<AnagramNotifier>().compareInputOne);
      // print(context.read<AnagramNotifier>().compareInputTwo);
    },
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      labelText: hint,
    ),
  );
}
