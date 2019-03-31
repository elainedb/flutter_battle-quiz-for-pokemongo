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
        primaryColor: Color(0xFFA60715),
        accentColor: Color(0xFFA60715),
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _totalAnswers = 0;
  int _rightAnswers = 0;

  Widget build(BuildContext context) {
    List<Type> types = Type.values;
    final _random = Random();

    TypeWidget attacker = TypeWidget(types[_random.nextInt(types.length)]);
    TypeWidget defender = TypeWidget(types[_random.nextInt(types.length)]);
    Type aType = attacker.type;
    Type dType = defender.type;

    return Scaffold(
      appBar: AppBar(
        title: Text('Battle Quiz for Pokémon Go'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Your score: $_rightAnswers / $_totalAnswers"),
          Text("What's the outcome of a battle with the following types?"),
          Row(
            children: <Widget>[
              attacker,
              Text('VS.'),
              defender,
            ],
          ),
          FloatingActionButton.extended(onPressed: () => {_computeScore(aType, dType, AttackRate.super_effective)}, icon: Icon(Icons.thumb_up), label: Text("Very effective"), backgroundColor: Colors.green,),
          FloatingActionButton.extended(onPressed: () => {_computeScore(aType, dType, AttackRate.regular)}, icon: Icon(Icons.thumbs_up_down), label: Text("Regular"), backgroundColor: Colors.blue,),
          FloatingActionButton.extended(onPressed: () => {_computeScore(aType, dType, AttackRate.not_very_effective)}, icon: Icon(Icons.thumb_down), label: Text("Not very effective"), backgroundColor: Colors.red,),
        ],
      ),
    );
  }

  _computeScore(Type attacker, Type defender, AttackRate userRate) {
    setState(() {
      if (getAttackRate(attacker, defender) == userRate) _rightAnswers++;
      _totalAnswers++;
    });
  }
}