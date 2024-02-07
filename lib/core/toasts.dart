import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasters {
  static void errorToast({required String toastMessage}) {
    Fluttertoast.showToast(
      msg: toastMessage,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
