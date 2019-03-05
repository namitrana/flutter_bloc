
/*Source of this project
  https://medium.com/flutter-community/flutter-bloc-package-295b53e95c5c

Another sources in different ways
  https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/
  ht1tps://medium.freecodecamp.org/how-to-handle-state-in-flutter-using-the-bloc-pattern-8ed2f1e49a13
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/counter_bloc.dart';

/*
 * In this project, we have two floating action buttons.  One is to increment
 * a value and the other is to decrement the same.
 *
 * We have used BLOC(Business Logic Component) to separate User-Interface with
 * business using BLOC design pattern.
 *
 * Please refer to the link below for detailed understanding.
 * https://medium.com/flutter-community/flutter-bloc-package-295b53e95c5c
 */

void main() => runApp(App());
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<CounterBloc>(
        bloc: _counterBloc,
        child: CounterPage(),
      ),
    );
  }


  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);


    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterEvent, int>(
        bloc: _counterBloc,
        builder: (BuildContext context, int count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}
