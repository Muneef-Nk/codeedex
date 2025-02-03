import 'dart:convert';

import 'package:codeedex/core/api/api/api.dart';
import 'package:codeedex/core/utils/helper_functioin.dart';
import 'package:codeedex/features/products_details/model/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsService {
  static getProductsDetails(String id) async {
    final url = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.PRODUCTS}/$id');

    final token = await getAccessToken();

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return ProductDetailsModel.fromJson(decodedData);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
