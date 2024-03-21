import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/colors.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/components/products_count_widget.dart';
import 'package:hancode_test/viewmodel/counter_provider.dart';
import 'package:hancode_test/viewmodel/total_price.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<CounterProvider>(
                  builder: (context, counterProvider, _) => ListView.separated(
                    separatorBuilder: (context, index) => kHeight10,
                    shrinkWrap: true,
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      final item = selectedItems[index];
                      final price = double.parse(
                          item['price'].replaceAll('₹', '').trim());
                      final quantity = item["quantity"];
                      final totalPrice = price * quantity;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${index + 1}."),
                          Text(
                            item['name'],
                          ),
                          ProductsCount(
                            index: index,
                            quantity: quantity,
                          ),
                          Text(totalPrice.toString()),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Add more Services",
                  style: TextStyle(color: Colors.lightGreen),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Frequently added services",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://www.homelane.com/blog/wp-content/uploads/2022/03/shutterstock_1933754300.jpg",
                              width: 160,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Bathroom Cleaning",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "₹ 500.00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        color: const Color.fromARGB(255, 236, 234, 234),
                        height: 40,
                        child: const Center(
                            child: Text(
                          "Coupon code",
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Enter Coupon Code",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 50,
                                color: const Color.fromARGB(255, 2, 74, 39),
                                child: Center(
                                    child: Text(
                                  "Apply",
                                  style: latoW,
                                )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      "assets/done.png",
                      height: 40,
                      width: 40,
                    ),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Your wallet balance is ₹125, you can redeem ₹10 in this order",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        color: const Color.fromARGB(255, 236, 234, 234),
                        height: 40,
                        child: const Center(
                            child: Text(
                          "Bill Details",
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: selectedItems.length,
                        itemBuilder: (context, index) {
                          final item = selectedItems[index];
                          final price = double.parse(
                              item['price'].replaceAll('₹', '').trim());
                          final quantity = item["quantity"];
                          final totalPrice = price * quantity;

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item['name']),
                                    Text(totalPrice.toString()),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total price : ",
                              style: latoBold,
                            ),
                            Text(
                              calculateTotalPrice(selectedItems,
                                      Provider.of<CounterProvider>(context))
                                  .toString(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 45, 75, 11),
                  height: 40,
                  child: const Center(
                    child: Text(
                      "Book Slot",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kWhite),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
