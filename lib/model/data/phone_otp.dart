import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneOtp {
  String smsCode = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhonenumber(
      String number, BuildContext context, String verificationId) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          throw (e);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> verifyOtp(
      String userOtp, BuildContext context, String verificationId) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );
      await auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
