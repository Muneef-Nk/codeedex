import 'package:codeedex/features/products_details/model/product_details_model.dart';
import 'package:codeedex/features/products_details/service/products_details_service.dart';
import 'package:flutter/material.dart';

class ProductsDetailsViewmodel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ProductDetailsModel? productDetailsModel;

  Future<void> getProductsDetails(BuildContext context, String id) async {
    _setLoading(true);

    try {
      productDetailsModel = await ProductDetailsService.getProductsDetails(id);
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
}
