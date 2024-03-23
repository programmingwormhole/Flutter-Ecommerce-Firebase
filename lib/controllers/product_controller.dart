import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  RxString selectedSize = RxString('');

  RxList sizes = [].obs;

  final user = FirebaseAuth.instance.currentUser;

  addToCart(QueryDocumentSnapshot product) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email)
        .collection('cart')
        .add({
      'user_email': user!.email,
      'product_id': product.id,
      'name': product['name'],
      'price': product['discount_price'] ?? product['original_price'],
      'image': product['image'],
      'variant': selectedSize.value,
      'quantity': 1,
    }).then((value) {
      Get.snackbar(
        'Success',
        'Product successfully added to cart',
        colorText: Colors.white,
      );
    });
  }
}
