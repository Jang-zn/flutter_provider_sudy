import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SelectedNamePage extends StatefulWidget {
  const SelectedNamePage({Key? key, required this.list}) : super(key: key);
  final List<WordPair> list;

  @override
  _SelectedNamePageState createState() => _SelectedNamePageState();
}

class _SelectedNamePageState extends State<SelectedNamePage> {
  @override
  Widget build(BuildContext context) {
    const _biggerFont = TextStyle(fontSize: 18.0);
    return Scaffold(
      appBar: AppBar(),
      body:Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (ctx, idx) {
                return ListTile(
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.list[idx].asPascalCase,
                          style: _biggerFont,
                        ),
                        const Divider(),
                     ],
                   ),
                  onTap: (){

                  },
                );
              })),
    );
  }
}
