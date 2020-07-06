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

const kTextFieldDecoration = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(
    fontSize: 15,
    color: Colors.black,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
);
