import 'package:get/get.dart';
import 'package:shop_getx/models/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  // double testAmount = 0;

  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }
}
