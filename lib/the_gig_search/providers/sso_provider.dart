import 'package:api_task/core/toasts.dart';
import 'package:api_task/the_gig_search/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SsoProvider extends ChangeNotifier {
  bool isLoading = false;
  void signInWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Logged In: ${credential.user!.email}');
      isLoading = false;
      navKey.currentState!.pushNamedAndRemoveUntil(
        Routes.gigVerificationInProgressPageRoute,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('AuthError: No user found for that email.');
        Toasters.errorToast(
            toastMessage: 'AuthError: No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('AuthError: Wrong password provided for that user.');
        Toasters.errorToast(
            toastMessage: 'AuthError: Wrong password provided for that user.');
      }
      isLoading = false;
    } catch (e) {
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
      isLoading = false;
    }
    notifyListeners();
  }

  void googleSso() async {
    isLoading = true;
    notifyListeners();
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credentialToParse = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final credential =
          await FirebaseAuth.instance.signInWithCredential(credentialToParse);
      print('Logged In: ${credential.user!.email}');
      isLoading = false;
      navKey.currentState!.pushNamedAndRemoveUntil(
        Routes.gigVerificationInProgressPageRoute,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'user-not-found') {
        print('AuthError: No user found for that email.');
        Toasters.errorToast(
            toastMessage: 'AuthError: No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('AuthError: Wrong password provided for that user.');
        Toasters.errorToast(
            toastMessage: 'AuthError: Wrong password provided for that user.');
      }
    } catch (e) {
      isLoading = false;
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
    }
    notifyListeners();
  }

  void appleSso() async {
    isLoading = true;
    notifyListeners();
    try {
      // final appleProvider = AppleAuthProvider();
      // UserCredential userCredential;
      // if (kIsWeb) {
      //   userCredential =
      //       await FirebaseAuth.instance.signInWithPopup(appleProvider);
      // } else {
      //   userCredential =
      //       await FirebaseAuth.instance.signInWithProvider(appleProvider);
      // }

      // print('Logged In: ${userCredential.user!.email}');
      Future.delayed(const Duration(seconds: 1), () {
        isLoading = false;
        navKey.currentState!.pushNamedAndRemoveUntil(
          Routes.gigVerificationInProgressPageRoute,
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      if (e.code == 'user-not-found') {
        print('AuthError: No user found for that email.');
        Toasters.errorToast(
            toastMessage: 'AuthError: No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('AuthError: Wrong password provided for that user.');
        Toasters.errorToast(
            toastMessage: 'AuthError: Wrong password provided for that user.');
      }
    } catch (e) {
      isLoading = false;
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
    }
    notifyListeners();
  }

  void logOut() async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signOut();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
    }
    navKey.currentState!.pushNamedAndRemoveUntil(
      Routes.gigSplashPageRoute,
      (route) => false,
    );
    notifyListeners();
  }
}
