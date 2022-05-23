import 'package:flutter/material.dart';
import 'package:pizza_order/constants.dart';
import 'package:pizza_order/helpers/cache_helper.dart';
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
      CacheHelper.save(key: 'user_id', value: user.user!.uid);
      
      
    }).catchError((error) {
      // debugPrint(error.toString());
      // switch (error.code) {
      //   case "ERROR_INVALID_EMAIL":
      //     _message = "Your email address appears to be malformed.";
      //     break;
      //   case "ERROR_WRONG_PASSWORD":
      //     _message = "Your password is wrong.";
      //     break;
      //   case "ERROR_USER_NOT_FOUND":
      //     _message = "User with this email doesn't exist.";
      //     break;
      //   case "ERROR_USER_DISABLED":
      //     _message = "User with this email has been disabled.";
      //     break;
      //   case "ERROR_TOO_MANY_REQUESTS":
      //     _message = "Too many requests. Try again later.";
      //     break;
      //   case "ERROR_OPERATION_NOT_ALLOWED":
      //     _message = "Signing in with Email and Password is not enabled.";
      //     break;
      //   default:
      //     _message = "An undefined Error happened.";
      // }
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
      CacheHelper.save(key: 'user_id', value: user.user!.uid);
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

  Future<void> logUserOut() async {
    await FirebaseServices.logOut();
    await CacheHelper.remove('user_id');
    Constants.userId = '';
  }
}
