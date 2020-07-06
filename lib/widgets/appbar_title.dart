import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key key,
    this.text1,
    this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
