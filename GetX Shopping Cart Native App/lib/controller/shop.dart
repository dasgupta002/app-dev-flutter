import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/item.dart';

class shopController extends GetxController {
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    await Future.delayed(Duration(seconds: 2));
    var response = [
      Item(ID: 1, name: 'Spunky Tshirts', description: 'Wickster Breathable Linen with hand dye colors!', image: '', price: 60),
      Item(ID: 2, name: 'Rocket Boards', description: 'Streetpun wooden boards with full flexibility!', image: '', price: 112)
    ];

    products.value = response;
  }
}