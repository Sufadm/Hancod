import 'package:flutter/material.dart';
import 'package:hancode_test/viewmodel/servide_selection_model.dart';
import 'package:provider/provider.dart';

class SelectButtons extends StatelessWidget {
  const SelectButtons({
    super.key,
    required this.context,
    required this.title,
    required this.index,
    required this.selectedIndex,
  });

  final BuildContext context;
  final String title;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        Provider.of<ServiceSelectionModel>(context, listen: false)
            .selectIndex(index);
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
