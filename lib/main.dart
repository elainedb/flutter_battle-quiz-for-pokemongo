import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_battle_quiz_for_pokemongo/rate_util.dart';
import 'package:flutter_svg/flutter_svg.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Pokemon',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Battle Quiz for Pokémon Go'),
        ),
        body: MySfulWgt(),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class MySfulWgt extends StatefulWidget {
  MySfulWgt({Key k}) : super(key: k);

  @override
  _MySfulWgtState createState() => _MySfulWgtState();
}

class _MySfulWgtState extends State<MySfulWgt> {
  int _total = 0;
  int _right = 0;

  Widget build(BuildContext c) {
    final r = Random();
    int iA = r.nextInt(T.values.length);
    int iD = r.nextInt(T.values.length);
    TWgt a = TWgt(T.values[iA], S.values[iA].toString());
    TWgt d = TWgt(T.values[iD], S.values[iD].toString());
    T tA = a.t;
    T tD = d.t;

    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Text('What\'s the outcome?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              a,
              Text('VS.'),
              d,
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.G)}, icon: Icon(Icons.thumb_up), label: Text('Super effective'), backgroundColor: Colors.green,),
                    FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.R)}, icon: Icon(Icons.thumbs_up_down), label: Text('Regular'), backgroundColor: Colors.orange,),
                    FloatingActionButton.extended(onPressed: () => {_compute(tA, tD, A.B)}, icon: Icon(Icons.thumb_down), label: Text('Not very effective'), backgroundColor: Colors.red,),
                  ],
                ),
                Center(
                  child: Text('Your score:\n\n$_right / $_total', textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _compute(T a, T d, A r) {
    String t = 'Bad answer!';
    Color c = Colors.red;
    setState(() {
      if (getA(a, d) == r) {
        t = 'Right answer!';
        c = Colors.green;
        _right++;
      }
      _total++;
    });

    Scaffold.of(context).showSnackBar(SnackBar(content: Text(t, style: TextStyle(fontFamily: 'Pokemon'),), backgroundColor: c, duration: Duration(milliseconds: 500),));
  }
}

class TWgt extends StatelessWidget {
  final T t;
  final String n;

  TWgt(this.t, this.n, {Key k}) : super(key: k);

  @override
  Widget build(BuildContext c) {
    String s = n.split('.')[1];

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(
            'assets/type-$s.svg',
            width: 150,
          ),
        ),
        Text(s)
      ],
    );
  }
}