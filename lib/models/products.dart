class Product {
  String id;
  String name;
  String price;
  String category;
  String image;

  Product({this.id, this.name, this.price, this.category, this.image});

  factory Product.fromJson(parsedJson) {
    return Product(
      id: parsedJson['id'],
      name: parsedJson['name'],
      price: parsedJson['price'],
      category: parsedJson['category'],
      image: parsedJson['image'],
    );
  }
}
