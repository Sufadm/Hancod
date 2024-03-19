// import 'package:flutter/material.dart';
// import 'package:hancode_test/model/res/constant/sizedbox.dart';
// import 'package:pinput/pinput.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hancode_test/view/bottomnav/bottom_nav_screen.dart';

// class VerificationPage extends StatefulWidget {
//   final String verificationId;
//   final String phoneNumber;

//   const VerificationPage({
//     Key? key,
//     required this.verificationId,
//     required this.phoneNumber,
//   }) : super(key: key);

//   @override
//   VerificationPageState createState() => VerificationPageState();
// }

// class VerificationPageState extends State<VerificationPage> {
//   var pinController = TextEditingController();

//   void verifyOTP(String enteredOTP) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: enteredOTP,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);

//       Navigator.pushReplacement(
//         // ignore: use_build_context_synchronously
//         context,
//         MaterialPageRoute(builder: (context) => const BottomNav()),
//       );
//     } catch (e) {
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text('OTP verification failed. Please try again.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.network(
//                   "https://media.licdn.com/dms/image/D560BAQFSntLz6QNL7Q/company-logo_200_200/0/1695966637368/hancod_logo?e=2147483647&v=beta&t=uTL6Ob2tTp4PDA34mE4TIV4O8A8bjs-1PkAY-oGJ5UM",
//                 ),
//               ),
//               kHeight15,
//               Pinput(
//                 controller: pinController,
//                 length: 6,
//                 validator: (s) {
//                   return s == null ? 'PIN is required' : null;
//                 },
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 showCursor: true,
//                 onCompleted: (pin) async {
//                   verifyOTP(pin);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hancode_test/view/bottomnav/bottom_nav_screen.dart';

class VerificationPage extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const VerificationPage({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                "https://media.licdn.com/dms/image/D560BAQFSntLz6QNL7Q/company-logo_200_200/0/1695966637368/hancod_logo?e=2147483647&v=beta&t=uTL6Ob2tTp4PDA34mE4TIV4O8A8bjs-1PkAY-oGJ5UM",
              ),
            ),
            kHeight15,
            OTPVerificationForm(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
              onVerificationSuccess: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNav()),
                );
              },
              onVerificationError: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text(
                          'OTP verification failed. Please try again.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
