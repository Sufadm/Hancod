import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationForm extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;
  final void Function()? onVerificationSuccess;
  final void Function()? onVerificationError;

  const OTPVerificationForm({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
    this.onVerificationSuccess,
    this.onVerificationError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pinController = TextEditingController();

    return Form(
      child: Column(
        children: [
          Pinput(
            defaultPinTheme: const PinTheme(
              height: 50,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3))),
            ),
            controller: pinController,
            length: 6,
            validator: (s) {
              return s == null ? 'PIN is required' : null;
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) async {
              verifyOTP(pin, context);
            },
          ),
        ],
      ),
    );
  }

  void verifyOTP(String enteredOTP, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: enteredOTP,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      onVerificationSuccess?.call();
    } catch (e) {
      onVerificationError?.call();
    }
  }
}
