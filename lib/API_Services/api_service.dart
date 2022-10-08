import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_constant.dart';
import 'data_models.dart';

class ApiService {
  Future<List<ProductModel>?> getProducts() async {
    List<ProductModel> productModel = [];
    try {
      var url = Uri.parse(ApiConstants.productBaseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        productModel = postModelFromJson(response.body);
        if (kDebugMode) {
          print(productModel);
        }
        return productModel;
      } else {
        if (kDebugMode) {
          print('response.statusCode');
        }
        if (kDebugMode) {
          print('response.body');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  Future<ProductModel?> getProductsDetails(int id) async {
    ProductModel productModel;
    try {
      var url = Uri.parse(ApiConstants.productBaseUrl + id.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(json.decode(response.body));
        if (kDebugMode) {
          print(productModel);
        }
        return productModel;
      } else {
        if (kDebugMode) {
          print('response.statusCode');
        }
        if (kDebugMode) {
          print('response.body');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
