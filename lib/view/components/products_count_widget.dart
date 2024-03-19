import 'package:flutter/material.dart';
import 'package:hancode_test/viewmodel/counter_provider.dart';
import 'package:provider/provider.dart';

class ProductsCount extends StatelessWidget {
  final int quantity;
  final int index;
  const ProductsCount({
    super.key,
    required this.quantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, value, _) => Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              value.getCounter(index) > 1 ? value.decrement(index) : "1";
            },
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
            onPressed: () {
              value.increment(index);
            },
          ),
        ],
      ),
    );
  }
}
