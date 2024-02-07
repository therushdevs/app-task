import 'package:api_task/core/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountProvider extends ChangeNotifier {
  bool isLoading = false;
  void createAccountWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'weak-password') {
        print('AuthError: The password provided is too weak.');
        Toasters.errorToast(
            toastMessage: 'AuthError: The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('AuthError: The account already exists for that email.');
        Toasters.errorToast(
            toastMessage:
                'AuthError: The account already exists for that email.');
      }
    } catch (e) {
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
    }
    notifyListeners();
  }
}
