import 'package:flutter/material.dart';
import 'package:hancode_test/model/data/phone_otp.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/auth/verification_page.dart';
import 'package:hancode_test/viewmodel/timer.dart';
import 'package:provider/provider.dart';

class TimerWidget extends StatelessWidget {
  final String phoneNum;
  const TimerWidget({super.key, required this.phoneNum});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timer, _) {
        return timer.secondsRemaining == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      AuthenticationService.sendPhoneNumber(
                        phoneNum,
                        onVerificationCompleted: (credential) {},
                        onVerificationFailed: (exception) {},
                        onCodeSent: (verificationId, _) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VerificationPage(
                              phoneNumber: phoneNum,
                              verificationId: verificationId,
                            );
                          }));
                        },
                        onCodeAutoRetrievalTimeout: (verificationId) {},
                      );
                    },
                    child: Text(
                      "Resend",
                      style: latoW,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Resend in ${timer.secondsRemaining} seconds",
                    style: latoW,
                  ),
                ],
              );
      },
    );
  }
}
