import 'package:flutter/material.dart';

class ProductAdd extends StatelessWidget {
  final int quantity;
  const ProductAdd({
    super.key,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {},
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          width: 20,
          height: 25,
          child: Center(
            child: Text(
              quantity.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
