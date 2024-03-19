import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/colors.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/viewmodel/counter_provider.dart';
import 'package:provider/provider.dart';

class AddCartButton extends StatelessWidget {
  final int index;
  const AddCartButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, _) => InkWell(
        onTap: () {
          counterProvider.increment(index);
        },
        child: Container(
          height: counterProvider.getCounter(index) == 0 ? 50 : null,
          width: counterProvider.getCounter(index) == 0 ? 100 : null,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color.fromARGB(255, 0, 122, 32),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                counterProvider.getCounter(index) > 0
                    ? IconButton(
                        onPressed: () {
                          counterProvider.decrement(index);
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: kWhite,
                        ))
                    : const SizedBox(),
                Text(
                  counterProvider.getCounter(index) > 0
                      ? "${counterProvider.getCounter(index)}"
                      : "Add",
                  style: latoW,
                ),
                counterProvider.getCounter(index) > 0
                    ? IconButton(
                        onPressed: () {
                          counterProvider.increment(index);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: kWhite,
                        ))
                    : const SizedBox(),
                kWidth5,
                counterProvider.getCounter(index) == 0
                    ? const Icon(
                        Icons.add,
                        color: kWhite,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
