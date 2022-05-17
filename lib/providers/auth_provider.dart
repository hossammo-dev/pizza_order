import 'package:flutter/material.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/models/user_model.dart';
import 'package:pizza_order/services/firebase_services.dart';

class AuthProvider extends ChangeNotifier {
  bool _showPassword = false;
  bool get showPassword => _showPassword;

  changePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  Future<void> logUserIn({String? email, String? password}) async {
    FirebaseServices.signUserIn(email: email, password: password).then((user) {
      Constants.userId = user.user!.uid;
    }).catchError((error) {
      debugPrint(error.toString());
    });
    notifyListeners();
  }

  Future<void> createAccount({
    String? username,
    String? email,
    String? phoneNumber,
    String? password,
  }) async {
    FirebaseServices.createNewUser(email: email, password: password)
        .then((user) {
      Constants.userId = user.user!.uid;
      UserModel _userModel = UserModel(
        uid: Constants.userId,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
      );

      FirebaseServices.saveData(
        collection: 'users',
        id: user.user!.uid,
        data: _userModel.toJson(),
      );
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
