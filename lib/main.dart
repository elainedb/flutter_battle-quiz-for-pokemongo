import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_battle_quiz_for_pokemongo/type_widget.dart';
import 'package:flutter_battle_quiz_for_pokemongo/rate_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battle Quiz for Pokémon Go',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key k}) : super(key: k);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _total = 0;
  int _right = 0;

  Widget build(BuildContext c) {
    final r = Random();
    int iA = r.nextInt(T.values.length);
    int iD = r.nextInt(T.values.length);

    String nA = S.values[iA].toString();
    String nD = S.values[iD].toString();
    TypeWidget a = TypeWidget(T.values[iA], nA);
    TypeWidget d = TypeWidget(T.values[iD], nD);
    T tA = a.type;
    T tD = d.type;

    return Scaffold(
      appBar: AppBar(
        title: Text('Battle Quiz for Pokémon Go'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Your score: $_right / $_total"),
          Text("What's the outcome of the battle below?"),
          Row(
            children: <Widget>[
              a,
              Text('VS.'),
              d,
            ],
          ),
          FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.G)}, icon: Icon(Icons.thumb_up), label: Text("Very effective"), backgroundColor: Colors.green,),
          FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.R)}, icon: Icon(Icons.thumbs_up_down), label: Text("Regular"), backgroundColor: Colors.blue,),
          FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.B)}, icon: Icon(Icons.thumb_down), label: Text("Not very effective"), backgroundColor: Colors.red,),
        ],
      ),
    );
  }

  _compute(T a, T d, A r) {
    setState(() {
      if (getA(a, d) == r) _right++;
      _total++;
    });
  }
}