import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  int getCount() =>_count;

  void increment(int value){
    _count+=value;
    notifyListeners();
  }

  void decrement(int value){
    if(_count>0){
      _count-=value;
      notifyListeners();
    }
  }
}