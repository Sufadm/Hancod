import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/components/timer_widget.dart';
import 'package:hancode_test/viewmodel/loading.dart';
import 'package:hancode_test/viewmodel/verification_form.dart';
import 'package:hancode_test/view/bottomnav/bottom_nav_screen.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;
  VerificationPage({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);
  bool isVerified = false;

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
                isVerified = true;
              },
              onVerificationError: () {
                const Text(
                  "OTP verification failed. Please try again",
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            kHeight5,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "We have send an OTP to your Number",
                    style: latoW,
                  ),
                ],
              ),
            ),
            Consumer<Loading>(
              builder: (context, value, child) {
                return value.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const BeveledRectangleBorder())),
                            onPressed: () {
                              if (isVerified == true) {
                                value.loading = true;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BottomNav()),
                                );
                              } else {}
                            },
                            child: Text(
                              "Continue",
                              style: latoB,
                            )));
              },
            ),
            kHeight10,
            Container(
                margin: const EdgeInsets.only(right: 7),
                child: TimerWidget(
                  phoneNum: phoneNumber,
                )),
          ],
        ),
      ),
    );
  }
}
