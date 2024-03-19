import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hancode_test/view/auth/login_page.dart';

class AuthenticationService {
  static void sendPhoneNumber(
    String phoneNumber, {
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String, int?) onCodeSent,
    required Function(String) onCodeAutoRetrievalTimeout,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: onVerificationCompleted,
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      onVerificationFailed(e);
    }
  }
}

void logout(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
}
