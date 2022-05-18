// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/models/dish_model.dart';
import 'package:pizza_order/models/order_model.dart';
import 'package:pizza_order/services/firebase_services.dart';
import 'package:uuid/uuid.dart';

class MainProvider extends ChangeNotifier {
  // DishModel? _dishModel;
  // DishModel? get dishModel => _dishModel;

  List<DishModel> _dishesList = [];
  List<DishModel> get dishesList => _dishesList;

  List<DishModel> _lunchList = [];
  List<DishModel> get lunchList => _lunchList;

  void getFavoriteDishes() async {
    await FirebaseServices.getAllData('products').then((value) {
      for (var element in value.docs) {
        _dishesList.add(DishModel.fromJson(element.data()));
      }
      debugPrint('--- ${_dishesList[0].id}');
    });
    notifyListeners();
  }

  void getLunchDishes() async {
    await FirebaseServices.getAllData('business_lunch').then((value) {
      for (var element in value.docs) {
        _lunchList.add(DishModel.fromJson(element.data()));
      }
    });
  }

  // void addOrder({
  //   required DishModel? dishModel,
  //   required String? size,
  //   int? cheese,
  //   bool? onion,
  //   bool? bacon,
  //   bool? beef,
  // }) async {
  //   final String? _orderId = const Uuid().v4();

  //   OrderModel _orderModel = OrderModel(
  //     id: _orderId,
  //     uid: Constants.userId,
  //     dishId: dishModel!.id,
  //     size: size,
  //     cheese: cheese,
  //     onion: onion,
  //     bacon: bacon,
  //     beef: beef,
  //     time: DateTime.now(),
  //   );
  //   await FirebaseServices.saveData(
  //     collection: 'orders',
  //     id: _orderId,
  //     data: _orderModel.toJson(),
  //   );
  // }
}
