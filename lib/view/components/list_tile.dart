import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  const ListTileWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: Border.all(color: const Color.fromARGB(255, 123, 121, 121)),
        title: Text(text),
        leading: icon);
  }
}
