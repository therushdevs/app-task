import 'package:api_task/core/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SsoProvider {
  bool isLoading = false;
  bool success = false;
  late User userCredential;
  void signInWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      success = true;
      isLoading = false;
      userCredential = credential.user!;
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
      print('AuthError: $e');
      Toasters.errorToast(
        toastMessage: 'AuthError: ${e.toString()}',
      );
    }
  }

  Future<UserCredential> googleSso() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
