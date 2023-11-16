import 'package:calaton_third_project/domain/product/iproduct.dart';

class Product implements IProduct {
  @override
  final String category;

  @override
  final String description;

  @override
  final int id;

  @override
  final String image;

  @override
  final String price;

  @override
  final String title;

  Product({
    required this.category,
    required this.price,
    required this.id,
    required this.description,
    required this.image,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
