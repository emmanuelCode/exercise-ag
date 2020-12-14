import 'package:exercise_ag/info_board.dart';
import 'package:flutter/material.dart';

/// the search widget for finding all anagrams
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                searchTextField(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        false
            ? Text('data')
            : Container(
                //if search text tenary operator...
                //TODO: to change when having result...
                //explanation container
                color: Colors.white,
                margin: EdgeInsets.only(top: 14.0),
                child: InfoBoard.searchExplanation(),
              ),
        Expanded(
          /// search list anagram
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 14.0),
            child: ListView.separated(
              //test widget
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('item $index'), //Todo To change
              ), //item widget
              separatorBuilder: (_, index) => Divider(
                color: Colors.grey,
                indent: 7.0,
                endIndent: 7.0,
              ),
              itemCount: 7, //todo : to change
            ),
          ),
        ),
      ],
    );
  }
}

/// the compare widget...
class Compare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      compareTextField('Word 1'),
                      SizedBox(height: 16),
                      compareTextField('Word 2'),
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
Widget searchTextField() {
  return Expanded(
    //textField need expanded (for rendering error)
    child: TextField(
      onChanged: (value) {
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
Widget compareTextField(String hint) {
  return TextField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      labelText: hint,
    ),
  );
}
