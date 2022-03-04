import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/item.dart';

class cartController extends GetxController {
  var products = [].obs;
  int get count => products.length;
  double get total => products.fold(0, (sum, element) => sum + element.price);

  addtoCart(Item item) {
    products.add(item);
  }
}