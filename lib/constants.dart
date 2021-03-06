import 'package:flutter/material.dart';

const String kApiKey = '8369d24b7bf35f174773bdd41435b557';

const Color kPrimaryColor = Color(0xFFFE8500);
const Color kSecondaryColor = Color(0xFFFEA492);
const Color kConsColor = Color(0xFF432906);

const InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white38,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 40,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: kConsColor),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    gapPadding: 10,
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 40),
);

const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 30,
  color: Color(0xDFFFFFFF),
);
const TextStyle kSubHeaderTextStyle = TextStyle(
  color: Color(0xAFFFFFFF),
  fontSize: 17.5,
);
const TextStyle kUnderTempTextStyle = TextStyle(
  color: kConsColor,
  fontSize: 18,
);
