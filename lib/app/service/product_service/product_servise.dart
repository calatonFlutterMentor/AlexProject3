import 'dart:convert';

import 'package:calaton_third_project/app/service/product_service/iproduct_servise.dart';
import 'package:calaton_third_project/data/model/product.dart';
import 'package:http/http.dart' as http;

class ProductService implements IProductService {
  static const _baseurl = 'https://fakestoreapi.com/products';

  Future<T> _getRequest<T>(
    Uri uri,
    T Function(List<dynamic>) parser,
  ) async {
    final response = await http.get(uri);
    final jsonResp = json.decode(response.body);
    return parser(jsonResp);
  }

  @override
  Future<List<Product>> fetchProducts() {
    return _getRequest(Uri.parse(_baseurl), (json) {
      var res = json;
      return res
          .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }
}
