import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/controllers/cart_controller.dart';
import 'package:pw_ecommerce/utils/colors.dart';
import 'package:pw_ecommerce/widgets/custom_app_bar.dart';
import 'package:pw_ecommerce/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.cart.length,
                      itemBuilder: (_, index) {
                        final product = controller.cart[index];

                        return ListTile(
                          leading: Image.network(product['image']),
                          title: Text(
                            product['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text('\$${product['price']}'),
                          trailing: Column(
                            children: [
                              Text('Size: ${product['variant']}'),
                              Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          controller.descrease(product.id),
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                    Text(
                                      product['quantity'].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          controller.increase(product.id),
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Obx(
                      () => Text(
                        '\$${controller.totalPrice.value}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: 'Buy Now',
                  onTap: () {
                    final cartItem = controller.cart;
                    print(cartItem.length);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
