import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx/controllers/cart_controller.dart';
import 'package:shop_getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade300,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(fontSize: 24),
            );
          },
        ),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        controller.products[index].productDescription,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.addToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                ),
                                child: const Text(
                                  '+ Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Obx(
                                () => IconButton(
                                  onPressed: () {
                                    shoppingController.products[index].isFavorite.toggle();
                                  },
                                  icon: Icon(shoppingController.products[index].isFavorite.value ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                      color: shoppingController.products[index].isFavorite.value ? Colors.red : Colors.grey),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            /// When we don't have an access to the controller by using put or find as well as
            /// don't have observable(Rx<T>, RxInt, .obs, ...) variables
            /// also methods must needed update() method called inside it, then use [GetBuilder]

            // GetBuilder<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total Amount: \$${controller.testAmount.toStringAsFixed(2)}',
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 32,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     );
            //   },
            // ),

            /// When we don't have an access to the controller by using put or find, Use GetX

            // GetX<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total Amount: \$${controller.totalPrice.toStringAsFixed(2)}',
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 32,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     );
            //   },
            // ),

            /// When we have an access to the controller by using put or find, Use Obx

            Obx(() => Text(
                  'Total Amount: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
