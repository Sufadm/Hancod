import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/style/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("1."),
                          const Text("Kitchen cleaning"),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 40,
                            child: const ProductAdd(),
                          ),
                          const Text("₹ 499.00"),
                        ],
                      ),
                    ],
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
                        const SizedBox(width: 10),
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
                                child: Text("sdsd"),
                              ),
                              Container(
                                width: 100,
                                height: 50,
                                color: Colors.greenAccent,
                                child: const Center(child: Text("Apply")),
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Kitchen cleaning"),
                              ],
                            ),
                            Text("Kitchen cleaning"),
                            Text("Kitchen cleaning"),
                            Text("Kitchen cleaning"),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(
                              "Total:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
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

class ProductAdd extends StatelessWidget {
  const ProductAdd({
    super.key,
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
          child: const Center(
            child: Text(
              "0",
              style: TextStyle(
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
