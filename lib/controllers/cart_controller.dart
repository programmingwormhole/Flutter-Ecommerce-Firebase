import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  final user = FirebaseAuth.instance.currentUser;
  var cart = <QueryDocumentSnapshot>[].obs;
  RxBool isLoading = RxBool(true);

  RxDouble totalPrice = RxDouble(0.0);

  @override
  onInit () {
    super.onInit();
    getCart();
  }

  getCart () async {

    final firebaseCart = await FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').get();

    isLoading.value = false;
    cart.value = firebaseCart.docs;

    calculateTotal();
    update();

  }

  descrease (String doc) async {
    final product = await FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').doc(doc).get();

    print(product);
    FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').doc(doc).update({
      'quantity' : product.data()!['quantity']-1,
    }).then((value) {
      getCart();
    });
  }

  increase (String doc) async {
    final product = await FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').doc(doc).get();

    print(product);
    FirebaseFirestore.instance.collection('users').doc(user!.email).collection('cart').doc(doc).update({
      'quantity' : product.data()!['quantity']+1,
    }).then((value) {
      getCart();
    });
  }

  calculateTotal () {
    double total = 0;

    for (var item in cart) {
      total += item['quantity'] * int.parse(item['price']);
    }

    totalPrice.value = total;
    update();

  }

}