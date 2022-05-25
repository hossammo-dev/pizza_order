import 'package:flutter/material.dart';

class DishDetailsProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<String> _sizes = const [
    'S',
    'M',
    'L',
  ];

  List<String> get sizes => _sizes;

  int _cheese = 1;
  int get cheese => _cheese;

  int _quantity = 1;
  int get quantity => _quantity;

  bool _onion = false;
  bool get onion => _onion;

  bool _bacon = false;
  bool get bacon => _bacon;

  bool _beef = false;
  bool get beef => _beef;

  void changeCheeseValue({String? operation}) {
    if (operation == 'i') {
      //increment
      _cheese++;
    } else {
      //decrement
      if (_cheese > 1) {
        _cheese--;
      }
    }
    notifyListeners();
  }

  void changeQuantityValue({String? operation}) {
    if (operation == 'i') {
      //increment
      _quantity++;
    } else {
      //decrement
      if (_quantity > 1) {
        _quantity--;
      }
    }
    notifyListeners();
  }

  void changeIngredients({String? ingredient}) {
    switch (ingredient) {
      case "Onion":
        _onion = !_onion;
        break;

      case "Bacon":
        _bacon = !_bacon;
        break;

      case "Beef":
        _beef = !_beef;
        break;
    }
    notifyListeners();
  }

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
