import 'package:flutter/material.dart';
import 'package:pizza_order/models/cart_model.dart';
import 'package:pizza_order/models/dish_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItemModel> _cartList = {};
  Map<String, CartItemModel> get cartList => _cartList;

  int get totalPrice {
    int _total = 0;
    _cartList.forEach((_, value) {
      _total += value.dishPrice! * value.quantity!;
    });
    return _total;
  }

  void addItem({
    required String size,
    required DishModel dishModel,
    required int quantity,
    int? cheese,
    bool? onion,
    bool? bacon,
    bool? beef,
  }) async {
    // if (!modified!) {
    _cartList.putIfAbsent(
      dishModel.id!,
      () => CartItemModel(
        dishName: dishModel.name,
        dishImageUrl: dishModel.imageUrl,
        dishPrice: int.tryParse(dishModel.price!),
        quantity: quantity,
        size: size,
        cheese: cheese,
        onion: onion,
        bacon: bacon,
        beef: beef,
      ),
    );
    // } else {
    //   _cartList.update(
    //     dishModel.id!,
    //     (existingCart) => CartItemModel(
    //       dishName: existingCart.dishName,
    //       dishImageUrl: existingCart.dishImageUrl,
    //       dishPrice: existingCart.dishPrice,
    //       quantity: existingCart.quantity! + 1,
    //       size: existingCart.size,
    //       cheese: existingCart.cheese,
    //       onion: existingCart.onion,
    //       bacon: existingCart.bacon,
    //       beef: existingCart.beef,
    //     ),
    //   );
    // }
    notifyListeners();
  }
}
