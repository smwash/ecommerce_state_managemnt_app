import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffFD6328);
const kSecondaryColor = Color(0xffFC8C28);

const kDefaultGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    kSecondaryColor,
    kPrimaryColor,
  ],
);

const kBoxShadow = BoxShadow(
  color: Colors.black12,
  offset: Offset(0, 10),
  blurRadius: 10.0,
);

const kTextStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600);
