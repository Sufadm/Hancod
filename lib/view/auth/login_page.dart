import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hancode_test/model/data/google_signin.dart';
import 'package:hancode_test/model/data/phone_otp.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/view/auth/verification_page.dart';
import 'package:hancode_test/view/bottomnav/bottom_nav_screen.dart';
import 'package:hancode_test/viewmodel/loading.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                    "https://media.licdn.com/dms/image/D560BAQFSntLz6QNL7Q/company-logo_200_200/0/1695966637368/hancod_logo?e=2147483647&v=beta&t=uTL6Ob2tTp4PDA34mE4TIV4O8A8bjs-1PkAY-oGJ5UM"),
              ),
              TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  } else if (value.length != 10) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixText: '+91 ',
                  prefixStyle: TextStyle(color: Colors.white, fontSize: 16),
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              kHeight10,
              Consumer<Loading>(
                builder: (context, value, child) => value.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                value.loading == true;
                                AuthenticationService.sendPhoneNumber(
                                  phoneController.text,
                                  onVerificationCompleted: (credential) {},
                                  onVerificationFailed: (exception) {
                                    value.loading;
                                  },
                                  onCodeSent: (verificationId, _) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VerificationPage(
                                          phoneNumber: phoneController.text,
                                          verificationId: verificationId,
                                        ),
                                      ),
                                    );
                                  },
                                  onCodeAutoRetrievalTimeout:
                                      (verificationId) {},
                                );
                              }
                            },
                            child: const Text(
                              "Send OTP",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: SignInButton(
                    Buttons.google,
                    text: "Sign up with Google",
                    onPressed: () async {
                      final userCredential = await signInWithGoogle();
                      if (userCredential != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const BottomNav();
                        }));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
