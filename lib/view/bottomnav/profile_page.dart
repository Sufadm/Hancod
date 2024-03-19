import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  return ListTileWidget(text: name, icon: icon);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
