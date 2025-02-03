import 'dart:convert';
import 'package:codeedex/core/api/api/api.dart';
import 'package:codeedex/core/utils/helper_functioin.dart';
import 'package:codeedex/features/home/model/products_models.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  static getProducts() async {
    final url = Uri.parse('${ApiConfig.BASE_URL}${ApiConfig.PRODUCTS}');

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
      List decodedData = jsonDecode(response.body);
      List<DataModel> productsList =
          decodedData.map((e) => DataModel.fromJson(e)).toList();
      return productsList;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
