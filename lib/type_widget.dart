import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_battle_quiz_for_pokemongo/rate_util.dart';

class TypeWidget extends StatelessWidget {
  final Type type;

  const TypeWidget(
    this.type, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String typeString = type.toString().split(".")[1];
    String assetName = 'assets/type-$typeString.svg';

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            assetName,
            semanticsLabel: typeString,
          ),
          Text(typeString)
        ],
      ),
    );
  }
}
