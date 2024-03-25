import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pw_ecommerce/widgets/custom_app_bar.dart';

class PaymentView extends StatelessWidget {
  final List<Map<String, dynamic>> cartData;
  final double totalAmount;

  const PaymentView(
      {super.key, required this.cartData, required this.totalAmount});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    createOrder () async {
      await FirebaseFirestore.instance.collection('orders').add({
        'email' : user!.email,
        'time' : DateTime.now(),
        'items' : cartData,
        'gateway_name' : 'bKash',
        'trx_id' : 'AUU&HB#&ds55',
      }).then((value) async {
        final cart = await FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').get();

        for (var item in cart.docs) {
          await item.reference.delete();
        }
      }).then((value) {
        Get.snackbar('Complete', 'Your order has been placed');
      });
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListTile(
        onTap: () {
          createOrder();
        },
        leading: Image.network(
            'https://seeklogo.com/images/B/bkash-logo-0C1572FBB4-seeklogo.com.png'),
        title: Text('bKash Payment'),
        subtitle: Text(
          'Pay with bkash',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
