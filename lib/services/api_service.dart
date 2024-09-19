import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:globosoft_test/model/model.dart';

class ApiService {
  final Dio dio = Dio();

Future<ProductModel> fetchProducts() async {
  final response = await dio.get('https://mansharcart.com/api/products/category/139/key/123456789');


  if (response.data is String) {
  
    var decodedResponse = jsonDecode(response.data);
    return ProductModel.fromJson(decodedResponse);
  }


  return ProductModel.fromJson(response.data);
}

}
