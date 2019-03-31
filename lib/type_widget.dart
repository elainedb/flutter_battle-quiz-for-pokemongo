import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_battle_quiz_for_pokemongo/rate_util.dart';

class TypeWidget extends StatelessWidget {
  final T type;
  final String name;

  const TypeWidget(
    this.type,
    this.name, {
    Key k,
  }) : super(key: k);

  @override
  Widget build(BuildContext c) {
    String nameStr = name.split(".")[1];

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/type-$nameStr.svg',
          ),
          Text(nameStr)
        ],
      ),
    );
  }
}
