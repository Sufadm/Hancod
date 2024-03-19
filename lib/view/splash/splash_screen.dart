import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hancode_test/view/auth/login_page.dart';
import 'package:hancode_test/view/bottomnav/bottom_nav_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkauth();
    super.initState();
  }

  void checkauth() async {
    await Future.delayed(const Duration(seconds: 2));
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
            "https://media.licdn.com/dms/image/D560BAQFSntLz6QNL7Q/company-logo_200_200/0/1695966637368/hancod_logo?e=2147483647&v=beta&t=uTL6Ob2tTp4PDA34mE4TIV4O8A8bjs-1PkAY-oGJ5UM"),
      ),
    );
  }
}
