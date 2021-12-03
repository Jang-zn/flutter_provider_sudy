import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_sudy/selected_notifier.dart';
import 'package:flutter_provider_sudy/selectedname.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    //구현한 changeNotifier를 연결해주는 Provider로 감싸줌
      ChangeNotifierProvider<SelectedNotifier>(
        create: (_)=>SelectedNotifier(),
        child:MaterialApp(
        title: "startUp Name Generator",
        theme:ThemeData.light(),
        home: RandomWords(),
      )
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _selectedNames = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx)=> SelectedNamePage(notifier:context.watch<SelectedNotifier>()),
                )
              );
            },
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }


  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return Consumer<SelectedNotifier>(
      builder:(ctx,selectedNotifier, child){
        return ListTile(
          title:
                Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
                trailing : selectedNotifier
                    .selectedNames.contains(pair)?Icon(Icons.favorite, color:Colors.redAccent):Icon(Icons.favorite_outline),

          onTap: () {
            selectedNotifier.toggleSelected(pair);
          },
        );
      },
    );
  }
}
