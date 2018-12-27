import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/Actions.dart';

class MyHomePage extends StatefulWidget {
  final Store<int> store;

  MyHomePage({Key key, this.store, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(store);
}

class _MyHomePageState extends State<MyHomePage> {
  final Store<int> store;

  _MyHomePageState(this.store);

  dynamic storeProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new StoreConnector<int, String>(
              builder: (context, count) {
                return new Text(
                  count,
                  style: TextStyle(fontSize: 50),
                );
              },
              converter: (store) => store.state.toString(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new StoreConnector<int, VoidCallback>(
                    builder: (context, callback) {
                  return MaterialButton(
                    child: Text("-", style: TextStyle(fontSize: 30)),
                    onPressed: callback,
                  );
                }, converter: (store) {
                  return () => store.dispatch(Actions.DECREASE);
                }),
                new StoreConnector<int, VoidCallback>(
                    builder: (context, callback) {
                  return MaterialButton(
                    child: Text("+", style: TextStyle(fontSize: 30)),
                    onPressed: callback,
                  );
                }, converter: (store) {
                  return () => store.dispatch(Actions.INCREASE);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
