import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class PromiloAuthProvider extends ChangeNotifier {
  bool isloading = false;
  bool success = false;
  bool hasError = false;
  String errorMsg = '';

  Future<void> login({
    required String username,
    required String password,
  }) async {
    isloading = true;
    const String apiUrl = 'https://apiv2stg.promilo.com/user/oauth/token';

    // String username = 'rpkrushikumar@gmail.com';
    // String password = 'bepossitive';

    String hashedPassword = sha256.convert(utf8.encode(password)).toString();

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      request.fields['username'] = username;
      request.fields['password'] = hashedPassword;
      request.fields['grant_type'] = 'password';

      request.headers['Authorization'] =
          'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==';

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Login successful');
        print('Response: $responseBody');
        isloading = false;
        success = true;
      } else {
        // Handle error response
        final String errMsg =
            " ${response.statusCode}: ${await response.stream.bytesToString()}";
        print('Error: $errMsg');
        isloading = false;
        hasError = true;
        errorMsg = errMsg;
        showError(errorMsg);
      }
    } catch (e) {
      print('Error: $e');
      isloading = false;
      hasError = true;
      errorMsg = e.toString();
      showError(errorMsg);
    }
    notifyListeners();
  }

  void showError(String errorMsg) {
    Fluttertoast.showToast(
        msg: errorMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
