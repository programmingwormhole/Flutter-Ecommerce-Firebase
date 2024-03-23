import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/controllers/product_controller.dart';
import 'package:pw_ecommerce/utils/colors.dart';
import 'package:pw_ecommerce/widgets/custom_app_bar.dart';
import 'package:pw_ecommerce/widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final controller = Get.put(ProductController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * .4,
                    color: AppColors.catBackground,
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Image.network(product['image']),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$${product['discount_price']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Available in stock',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          product['about'],
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .doc(product.id)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                          itemCount: snapshot.data!.data()!['sizes'].length,
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.selectedIndex.value = index;
                                  controller.selectedSize.value = snapshot.data!
                                      .data()!['sizes'][index]
                                      .toString();
                                },
                                child: Container(
                                  width: 40,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? AppColors.primaryColor
                                            : null,
                                    border: Border.all(
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!
                                          .data()!['sizes'][index]
                                          .toString(),
                                      style: TextStyle(
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: 'Add to cart',
                  onTap: () => controller.addToCart(product),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
