import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Icon icon;
  final String name;
  final Color color;
  const SearchWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color.fromARGB(255, 240, 238, 238),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Container(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          )
        ],
      ),
    );
  }
}
