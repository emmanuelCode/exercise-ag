import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('reads words.txt file', () async {
    //need this for loading asset in tests
    TestWidgetsFlutterBinding.ensureInitialized();

    //a quick debugging to see if the code DO passes here
    print('hey');

    //load file into String
    String words = await FileRead.loadString();
    //separate the words
    List<String> anagrams = words.split('\n');

    //a test to see the number of words created
    print('number of words ${anagrams.length}');

    //to test if we got the text
    expect(true, words.contains('aa'));

    //to test if I can get the second value of that word list
    expect('aah', anagrams[1]);
  });
}

//a static class for reading file (more like a helper function)
class FileRead {
  static Future<String> loadString() async {
    return await rootBundle.loadString(
        'lib/data/words.txt'); //?? "data/words.txt" doesn't work anymore? //framework changed?
  }
}
