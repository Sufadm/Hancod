import 'package:hancode_test/viewmodel/counter_provider.dart';

double calculateTotalPrice(
    List<Map<String, dynamic>> selectedItems, CounterProvider counterProvider) {
  double totalPrice = 0.0;
  for (int i = 0; i < selectedItems.length; i++) {
    final item = selectedItems[i];
    final price = double.parse(item['price'].replaceAll('₹', '').trim());
    final quantity = counterProvider.getCounter(i);
    totalPrice += price * quantity;
  }
  return totalPrice;
}
