import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//using etends means we are getting something form somewhere else i.e. another class
class CounterModel extends ChangeNotifier {
  int _counter = 0;
  //now we're gonna need a getter, it's basically used to get a value when state changes
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); //this tells all the registered listeners that something has changed
    //we use notifyListeners() to notify the change and update the UI
  }
}
