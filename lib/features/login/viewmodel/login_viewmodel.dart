import 'package:codeedex/core/color/color_contansts.dart';
import 'package:codeedex/core/utils/helper_functioin.dart';
import 'package:codeedex/features/home/view/home_view.dart';
import 'package:codeedex/features/login/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    _setLoading(true);

    try {
      final response = await LoginService.signin(
        email: email,
        password: password,
      );

      if (response['status'] == true) {
        showSnackBar(
          context,
          response['message'] ?? 'Logged In Successfully!',
          backgroundColor: AppColors.deepBlue,
        );

        saveAccessToken(response['token']);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeEcommerceScreen()));
      } else {
        String errorMessage = response['message'] ?? 'Something went wrong!';
        showSnackBar(context, errorMessage);
      }
    } catch (e) {
      showSnackBar(context, 'An error occurred. Please try again.');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
