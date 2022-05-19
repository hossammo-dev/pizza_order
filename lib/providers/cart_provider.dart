import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/models/cart_model.dart';
import 'package:pizza_order/models/dish_model.dart';
import 'package:pizza_order/services/firebase_services.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartItemModel> _cartList = {};
  Map<String, CartItemModel> get cartList => _cartList;

  int get totalPrice {
    int _total = 0;
    _cartList.forEach((_, value) {
      _total += value.dishPrice! * value.quantity!;
    });
    return _total;
  }

  // void getCartData() {
  //   print('--1--');
  //   final String _data = CacheHelper.get('cart_list') ?? 'empty';
  //   // _cartList.addAll(_data);
  //   _cartList = jsonDecode(_data);
  //   print(_data);
  //   notifyListeners();
  // }

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
    // final String _tempData = json.encode(_cartList);
    // CacheHelper.save(key: 'cart_list', value: _tempData);
    notifyListeners();
  }

  Future<void> makeOrder({
    required String? location,
    required String? estimatedTime,
    required String? paymentMethod,
  }) async {
    String? _orderId = const Uuid().v4();
    final List<CartItemModel> _tempList = _cartList.values.toList();
    await FirebaseServices.saveData(
      collection: 'orders',
      id: _orderId,
      data: {
        'id': _orderId,
        'uid': Constants.userId,
        'location': location,
        'estimated_time': estimatedTime,
        'payment_method': paymentMethod,
        'cart_items': _tempList.map((e) => e.toJson()).toList(),
      },
    ).whenComplete(() {
      _cartList = {};
      print('isEmpty: ${_cartList.isEmpty}');
    });
    notifyListeners();
  }
}
