import 'package:exercise_ag/anagram_notifier.dart';
import 'package:exercise_ag/widgets/bottom_navigation_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  //need this to initialize FileRead.loadString before the runApp();
  WidgetsFlutterBinding.ensureInitialized();
  String loadWordList = await FileRead.loadString(); //loads words.txt

  runApp(
    ChangeNotifierProvider(
      create: (_) => AnagramNotifier(loadWordList),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anagramist',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Anagramist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> sections = [Search(), Compare(), Stats()];

  void _onItemTapped(int itemIndex) {
    setState(() {
      _selectedIndex = itemIndex; //temp
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //to avoid pixel overflow when keyboard appears
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        // safe area to put item under the notification bar
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: sections[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compare_arrows),
          label: 'Compare',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}

/// a helper class to load word list
class FileRead {
  static Future<String> loadString() async {
    return await rootBundle.loadString('lib/data/words.txt');
  }
}
