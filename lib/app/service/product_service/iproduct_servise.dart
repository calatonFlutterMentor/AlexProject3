import '../../../data/model/product.dart';
import '../../../domain/product/iproduct.dart';

abstract class IProductService {
  Future<List<Product>> fetchProducts();
}
