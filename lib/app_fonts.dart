import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts{
  static double h1 = 34.r;
  static double h2 = 25.r;
  static double h3 = 20.r;
  static double h4 = 15.r;
  static double h5 = 12.r;

  static TextStyle get caption {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: h3);
  }

  static TextStyle get title {
    return TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w700, fontSize: h3);
  }

  static TextStyle get blueHeader1 {
    return TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w700, fontSize: h1);
  }

  static TextStyle get blackHeader2 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: h2);
  }

  static TextStyle get blackHeader3 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: h3);
  }

  static TextStyle get errorText {
    return TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w400, fontSize: h5);
  }

  static TextStyle get whiteText{
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: h4);
  }

  static TextStyle get whiteBoldText{
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: h4);
  }

  static TextStyle get yellowBoldText{
    return TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700, fontSize: 16.r);
  }

  static TextStyle get whiteBoldTextH3{
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.r);
  }

  static TextStyle get whiteTextH3{
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18.r);
  }

  static TextStyle get redHeader3 {
    return TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700, fontSize: h3,);
  }

  static TextStyle get whiteTextSmall{
    return TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: h5);
  }

  static TextStyle get blueText {
    return TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w400, fontSize: h4,);
  }

  static TextStyle get indigoText {
    return TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.w400, fontSize: h4,);
  }

  static TextStyle get indigoTextH5 {
    return TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.w400, fontSize: h5,);
  }

  static TextStyle get indigoBoldText {
    return TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.w700, fontSize: h4, );
  }

  static TextStyle get redBoldText {
    return TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700, fontSize: h4, );
  }

  static TextStyle get greyTextH5 {
    return TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: h5,);
  }

  static TextStyle get greyTextH4 {
    return TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: h4,);
  }

  static TextStyle get blackTextH4 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: h4,);
  }

  static TextStyle get blackTextH3 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 24.r, height: 2);
  }

  static TextStyle get blackBoldTextH4 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: h4,);
  }

  static TextStyle get blackTextH5 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: h5,);
  }

  static TextStyle get blackBoldTextH5 {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: h5,);
  }
}