import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalVals {
  static const backgroundColor = Color(0xFF5C28AF);
  static const appbarColor = Color(0xFF5c28b0);
  static const bottomNavSelectedColor = Color(0xFFf7499e);
  static const raiseColor = 0xFF71b553;
  static const downColor = 0xFFe07978;
  static const buttonColor = Color(0xFF2072ef);
  static const currencyColor = Color(0xFF4d16a8);

  //?Hive Texts
  static const hiveBox = "masscoinex";
  static const checkLogin = "checkLogin";
  static const register = "register";
  static const user = "user";

  //?ErrorToast
  static errorToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
