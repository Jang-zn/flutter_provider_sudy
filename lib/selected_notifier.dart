import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class SelectedNotifier extends ChangeNotifier{
  final _selectedNames = <WordPair>[];

  void toggleSelected(WordPair newWord){
    final alreadSaved = _selectedNames.contains(newWord);
      if(alreadSaved){
        _selectedNames.remove(newWord);
      }else{
        _selectedNames.add(newWord);
      }
      //consumer들에게 변화 알림
      notifyListeners();
  }

  void deleteSelected(WordPair word){
    _selectedNames.remove(word);
    //consumer들에게 변화 알림
    notifyListeners();
  }


  List<WordPair> get selectedNames =>_selectedNames;



}