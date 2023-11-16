abstract class IProduct {
  const IProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
  });

  final int id;
  final String title;
  final String price;
  final String description;
  final String? category;
  final String image;

}
