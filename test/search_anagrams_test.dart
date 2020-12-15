import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:collection/collection.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('search anagram test', () async {
    //test value
    String searchText = 'iceman';
    //load words file
    String text = await FileRead.loadString();
    //separate words
    List<String> words = text.split('\n');
    //equality function
    Function unOrderDeepEquality =
        const DeepCollectionEquality.unordered().equals;

    //compare runes (runes is a representation of characters into an array of digits)
    List<String> result = words.where((word) {
      return unOrderDeepEquality(word.runes, searchText.runes);
    }).toList();

    print(result);

    expect('[anemic, cinema, iceman]', result.toString());
  });
}

class FileRead {
  static Future<String> loadString() async {
    return await rootBundle.loadString(
        'lib/data/words.txt'); //?? "data/words.txt" doesn't work anymore? //framework changed?
  }
}
