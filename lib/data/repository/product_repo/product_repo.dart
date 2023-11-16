import 'package:calaton_third_project/app/service/product_service/iproduct_servise.dart';

import '../../model/product.dart';
import 'iproduct_repo.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({required IProductService productService})
      : _productService = productService;
  final IProductService _productService;

  @override
  Future<List<Product>> getAllProduct() {
    return _productService.fetchProducts();
  }
}
