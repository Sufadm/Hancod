import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hancode_test/model/data/phone_otp.dart';
import 'package:hancode_test/model/res/constant/profile_listtile.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/components/list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            kHeight25,
            Text(
              "My Account",
              style: latoBold,
            ),
            kHeight10,
            ListTile(
              leading: Container(
                color: Colors.green,
                height: 40,
                width: 50,
                child: Center(
                  child: Text(
                    "FE",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              title: Text(
                "Fathima Ebrahim",
                style: latoB,
              ),
              subtitle: Text(
                "+91 908 786 4233",
                style: GoogleFonts.lato(
                  fontSize: 12,
                ),
              ),
            ),
            kHeight20,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => kHeight10,
                itemCount: namesList.length,
                itemBuilder: (context, index) {
                  final name = namesList[index];
                  final icon = iconsList[index];
                  return ListTileWidget(
                      ontap: () {
                        if (index == 6) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Logout"),
                                content: const Text(
                                    "Are you sure you want to log out?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      logout(context);
                                    },
                                    child: const Text("Logout"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      text: name,
                      icon: icon);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
