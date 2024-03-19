import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatelessWidget {
  final String verificationId;

  const VerificationPage({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pinController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  "https://media.licdn.com/dms/image/D560BAQFSntLz6QNL7Q/company-logo_200_200/0/1695966637368/hancod_logo?e=2147483647&v=beta&t=uTL6Ob2tTp4PDA34mE4TIV4O8A8bjs-1PkAY-oGJ5UM",
                ),
              ),
              kHeight15,
              Pinput(
                controller: pinController,
                length: 6,
                validator: (s) {
                  return s == null ? 'Pin is required' : null;
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
