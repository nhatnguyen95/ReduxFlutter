import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'reducers/counterReducers.dart';
import 'containers/MyHomePage.dart';

void main() {
  final store = new Store<int>(counterReducer, initialState: 1);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  MyApp({Key key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
        store: store,
        child: new MaterialApp(
          title: 'Flutter & Redux',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(
            title: 'Flutter & Redux',
          ),
        ));
  }
}

