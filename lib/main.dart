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
        body: MyStatefulWidget(),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key k}) : super(key: k);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _totalAnswers = 0;
  int _correctAnswers = 0;

  Widget build(BuildContext c) {
    final r = Random();
    int attackerIndex = r.nextInt(Type.values.length);
    int defenderIndex = r.nextInt(Type.values.length);
    TypeWidget a = TypeWidget(Type.values[attackerIndex]);
    TypeWidget d = TypeWidget(Type.values[defenderIndex]);
    Type attackerType = a.type;
    Type defenderType = d.type;

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
                    FloatingActionButton.extended(
                      onPressed: () => {_compute(attackerType, defenderType, AttackRate.good)},
                      icon: Icon(Icons.thumb_up),
                      label: Text('Super effective'),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () => {_compute(attackerType, defenderType, AttackRate.regular)},
                      icon: Icon(Icons.thumbs_up_down),
                      label: Text('Regular'),
                      backgroundColor: Colors.orange,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () => {_compute(attackerType, defenderType, AttackRate.bad)},
                      icon: Icon(Icons.thumb_down),
                      label: Text('Not very effective'),
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'Your score:\n\n$_correctAnswers / $_totalAnswers',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _compute(Type attacker, Type defender, AttackRate rate) {
    String t = 'Bad answer!';
    Color c = Colors.red;
    setState(() {
      if (getAttackRate(attacker, defender) == rate) {
        t = 'Right answer!';
        c = Colors.green;
        _correctAnswers++;
      }
      _totalAnswers++;
    });

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        t,
        style: TextStyle(fontFamily: 'Pokemon'),
      ),
      backgroundColor: c,
      duration: Duration(milliseconds: 500),
    ));
  }
}

class TypeWidget extends StatelessWidget {
  final Type type;

  TypeWidget(this.type, {Key k}) : super(key: k);

  @override
  Widget build(BuildContext c) {
    String s = type.toString().split('.')[1];

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
