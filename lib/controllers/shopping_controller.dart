import 'package:get/get.dart';
import 'package:shop_getx/models/product.dart';

class ShoppingController extends GetxController {
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Product> productResult = [
      Product(
        id: 1,
        productName: 'ABC',
        productImage: 'ABCImg',
        productDescription: 'ABC Desc',
        price: 24.5,
      ),
      Product(
        id: 2,
        productName: 'DEF',
        productImage: 'DEFImg',
        productDescription: 'DEF Desc',
        price: 48.6,
      ),
      Product(
        id: 3,
        productName: 'GHI',
        productImage: 'GHIImg',
        productDescription: 'GHI Desc',
        price: 72.7,
      ),
    ];

    products.value = productResult;
  }
}
