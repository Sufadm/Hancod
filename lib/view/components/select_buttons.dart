import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancode_test/viewmodel/servide_selection_model.dart';

class SelectButtons extends ConsumerWidget {
  const SelectButtons({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  final String title;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceSelection = ref.watch(provider);
    final isSelected = index == serviceSelection.selectedIndex;

    return GestureDetector(
      onTap: () {
        serviceSelection.selectIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
