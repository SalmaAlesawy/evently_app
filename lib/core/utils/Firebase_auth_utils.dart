import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class FireBaseAuthUtils {
  static Future<bool> signUp(String emailAddress, String password) async {
    try {
      var fireBaseAuth = FirebaseAuth.instance;
       await fireBaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastification.show(
          title: const Text("The password provided is too weak."),
          type: ToastificationType.error,
          alignment: Alignment.center,
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastification.show(
          type: ToastificationType.error,
          title: const Text("The account already exists for that email."),
          alignment: Alignment.center,
        );
        print('The account already exists for that email.');
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  static Future<bool> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        toastification.show(
            type: ToastificationType.error,
            title: const Text("No user found for that email."),
            alignment: Alignment.center);

        print('No user found for that email.');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        toastification.show(
            type: ToastificationType.error,
            title: const Text("Wrong password provided for that user."),
            alignment: Alignment.center);

        print('Wrong password provided for that user.');
      }

      return Future.value(false);
    }
  }
}
