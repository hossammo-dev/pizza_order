// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pizza_order/models/dish_model.dart';
import 'package:pizza_order/services/firebase_services.dart';

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

  // void getDishData({String? collection, String? dishId}) async {
  //   await FirebaseServices.getData(collection: collection, id: dishId)
  //       .then((value) {
  //     _dishModel = DishModel.fromJson(value.data() as Map<String, dynamic>);
  //     debugPrint('--- ${_dishModel!.name}');
  //   });
  // }
}
