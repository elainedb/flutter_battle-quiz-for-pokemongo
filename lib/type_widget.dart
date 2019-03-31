import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_battle_quiz_for_pokemongo/rate_util.dart';

class TypeWidget extends StatelessWidget {
  final T t;
  final String n;

  const TypeWidget(
    this.t,
    this.n, {
    Key k,
  }) : super(key: k);

  @override
  Widget build(BuildContext c) {
    String s = n.split(".")[1];

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/type-$s.svg',
          ),
          Text(s)
        ],
      ),
    );
  }
}
