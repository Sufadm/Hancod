import 'package:flutter/material.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/cart/cart_page.dart';
import 'package:hancode_test/view/components/add_cart_button.dart';
import 'package:hancode_test/view/components/select_buttons.dart';
import 'package:hancode_test/viewmodel/counter_provider.dart';
import 'package:hancode_test/viewmodel/servide_selection_model.dart';
import 'package:provider/provider.dart';

class ServiceAllScreen extends StatelessWidget {
  ServiceAllScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> services = List.generate(
    7,
    (index) => {
      'image':
          "https://www.homelane.com/blog/wp-content/uploads/2022/03/shutterstock_1933754300.jpg",
      'rating': "(4.2/5) 23 Orders",
      'name': "Bathroom Cleaning",
      'duration': "60 minutes",
      'price': "₹ 499.00",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<ServiceSelectionModel>(
              builder: (context, model, _) => Container(
                height: 60,
                color: const Color.fromARGB(255, 207, 244, 208),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SelectButtons(
                        context: context,
                        title: 'Deep Cleaning',
                        index: 0,
                        selectedIndex: model.selectedIndex),
                    const SizedBox(width: 10),
                    SelectButtons(
                        context: context,
                        title: 'Maid Services',
                        index: 1,
                        selectedIndex: model.selectedIndex),
                    const SizedBox(width: 10),
                    SelectButtons(
                        context: context,
                        title: 'Car Cleaning',
                        index: 2,
                        selectedIndex: model.selectedIndex),
                  ],
                ),
              ),
            ),
            kHeight15,
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 100,
                            child: Image.network(
                              service['image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service['rating'],
                                    style: latoB,
                                  ),
                                  Text(
                                    service['name'],
                                    style: latoBold,
                                  ),
                                  const Text(
                                    "60 minutes",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(service['price']),
                                      //add cart button----------
                                      AddCartButton(index: index)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 229, 138, 1))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      List<Map<String, dynamic>> selectedItems = [];
                      for (int i = 1; i < services.length; i++) {
                        int quantity =
                            Provider.of<CounterProvider>(context, listen: false)
                                .getCounter(i);
                        if (quantity > 0) {
                          selectedItems.add({
                            'name': services[i]['name'],
                            'quantity': quantity,
                            'price': services[i]['price'],
                          });
                        }
                      }
                      return CartPage(
                        selectedItems: selectedItems,
                      );
                    }));
                  },
                  child: Text(
                    "View Cart",
                    style: latoW,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
