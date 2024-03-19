import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';

class ServiceWidget extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;

  const ServiceWidget({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 229, 229, 229),
            child: Image.asset(image),
          ),
        ),
        Text(
          text,
          style: latoB,
        )
      ],
    );
  }
}
