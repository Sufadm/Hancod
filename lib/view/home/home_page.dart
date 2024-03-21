import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancode_test/model/res/constant/service_imag.dart';
import 'package:hancode_test/model/res/constant/sizedbox.dart';
import 'package:hancode_test/model/res/style/textstyles.dart';
import 'package:hancode_test/view/service_list/list_service_page.dart';
import 'package:hancode_test/view/components/search_container.dart';
import 'package:hancode_test/view/components/service_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SearchWidget(
                      color: Color.fromARGB(255, 240, 238, 238),
                      name: "406, Skyline Park Dale, MM Road.... ",
                      icon: Icon(Icons.arrow_drop_down)),
                  kWidth20,
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0x0f5fcd70),
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              kHeight20,
              SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/Promo Advertising.png",
                    fit: BoxFit.cover,
                  )),
              kHeight10,
              const SearchWidget(
                  color: Colors.green,
                  name: "Search for a service",
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              kHeight10,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available Service",
                        style: latoBold,
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) {
                            return Column(
                              children: [
                                ServiceWidget(
                                  image: serviceimage[index],
                                  text: name[index],
                                ),
                                kHeight10,
                                ServiceWidget(
                                  image: serviceImage[index],
                                  text: name2[index],
                                  onTap: () {
                                    if (index == 3) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ProviderScope(
                                            child: ServiceAllScreen());
                                      }));
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kHeight10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Leaning Services",
                          style: latoB,
                        ),
                        const Text(
                          "See All",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) {
                        return Column(
                          children: [
                            Image.asset(
                              cleaningImage[index],
                              width: 150,
                              height: 120,
                            ),
                            kHeight5,
                            Text(cleaningServiceName[index])
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
