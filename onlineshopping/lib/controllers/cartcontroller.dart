import 'package:get/get.dart';
import 'package:onlineshopping/models/cart.dart';
import 'package:onlineshopping/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;
  var cartItemSet = Set<Product>().obs;

  int get totalItems => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + double.parse(item.price));

  int countOfParticular(Product product) {
    return cartItems.where((p) => p.id == product.id).length;
  }

  void cartItemsSet() {
    cartItemSet.value = cartItems.toSet();
  }

  addToCart(Product cartItem) {
    cartItems.add(cartItem);
  }

  removeProduct(Product cartItem) {
    cartItems.remove(cartItem);
  }
}
