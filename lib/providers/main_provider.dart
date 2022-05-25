// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pizza_order/models/dish_model.dart';
import 'package:pizza_order/services/firebase_services.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<DishModel> _dishesList = [];
  List<DishModel> get dishesList => _dishesList;

   final List<String> _categoriesList = const [
    'All Food',
    'Pizza',
    'Pasta',
    'Drinks',
    'Other',
  ];

  List<String> get categoriesList => _categoriesList;

  void getFavoriteDishes() async {
    await FirebaseServices.getAllData('products').then((value) {
      for (var element in value.docs) {
        _dishesList.add(DishModel.fromJson(element.data()));
      }
      debugPrint('--- ${_dishesList[0].id}');
    });
    notifyListeners();
  }

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
