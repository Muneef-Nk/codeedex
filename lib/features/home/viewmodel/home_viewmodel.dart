import 'package:codeedex/features/home/model/products_models.dart';
import 'package:codeedex/features/home/service/products_service.dart';
import 'package:flutter/material.dart';

class Homeviewmodel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<DataModel> productList = [];

  Future<void> getCategories(BuildContext context) async {
    _setLoading(true);

    try {
      productList = await ProductsService.getProducts();
    } catch (e) {
      _errorMessage = 'Failed to load vehicles. Please try again later.';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List categoryList = [
    {
      "image": "assets/svg/c1.svg",
      "title": "Engine",
      "onpressed": () {
        print('Engine');
      },
    },
    {
      "image": "assets/svg/c2.svg",
      "title": "Helmet",
      "onpressed": () {
        print('Helmet');
      },
    },
    {
      "image": "assets/svg/c3.svg",
      "title": "Type",
      "onpressed": () {
        print('Type');
      },
    },
    {
      "image": "assets/svg/c4.svg",
      "title": "Alloy",
      "onpressed": () {
        print('Alloy');
      },
    },
    {
      "image": "assets/svg/c5.svg",
      "title": "Seat",
      "onpressed": () {
        print('Seat');
      },
    },
  ];
}
