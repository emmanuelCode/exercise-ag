import 'package:flutter/material.dart';

class InfoBoard {
  static final Color textColor = Colors.black;

  static final TextSpan _anagramDefinition = TextSpan(
    text: 'Anagram: ',
    style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
    children: <TextSpan>[
      TextSpan(
          style: TextStyle(fontWeight: FontWeight.normal, color: textColor),
          text:
              'a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.\n\n'),
    ],
  );

  static Widget searchExplanation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            _anagramDefinition,
            TextSpan(
              text: 'Enter a word to find out all its anagrams.',
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  static Widget compareExplanation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            _anagramDefinition,
            TextSpan(
              text:
                  'Enter two words to find out if they are anagram of each other.',
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  /// for displaying longest and most anagrams
  static Widget StatsAnagram(String anagramEarnedTitle, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: anagramEarnedTitle + '\n\n',
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: TextStyle(color: textColor, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  /// the result of the two compared anagrams
  static Widget compareResultExplanation(String value1, String value2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: value1 + ' ',
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          children: <TextSpan>[
            TextSpan(
              text: 'and ',
              style: TextStyle(color: textColor, fontWeight: FontWeight.normal),
            ),
            TextSpan(
              text: value2 + ' ',
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'are anagrams!',
              style: TextStyle(color: textColor, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
