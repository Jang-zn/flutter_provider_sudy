import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_sudy/selected_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class SelectedNamePage extends StatefulWidget {
  const SelectedNamePage({Key? key, required this.notifier}) : super(key: key);
  final SelectedNotifier notifier;

  @override
  _SelectedNamePageState createState() => _SelectedNamePageState();
}

class _SelectedNamePageState extends State<SelectedNamePage> {
  @override
  Widget build(BuildContext context) {
    const _biggerFont = TextStyle(fontSize: 18.0);

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SelectedNotifier>(
          builder: (context, selectedNotifier, child) {
        return Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
                itemCount: selectedNotifier.selectedNames.length,
                itemBuilder: (ctx, idx) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedNotifier.selectedNames[idx].asPascalCase,
                          style: _biggerFont,
                        ),
                        const Divider(),
                      ],
                    ),
                    onTap: () {
                      selectedNotifier
                          .deleteSelected(widget.notifier.selectedNames[idx]);
                    },
                  );
                }));
      }),
    );
  }
}
