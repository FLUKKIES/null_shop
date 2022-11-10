enum ProductType { pen, book, eraser }

class Product {
  final String? uid;
  final String name;
  final double price;
  final int quantity;
  final ProductType? type;
  final String? description;
  final String? photoURL;

  static ProductType? getProductType(String type) {
    switch (type) {
      case 'pen':
        return ProductType.pen;
      case 'book':
        return ProductType.book;
      case 'eraser':
        return ProductType.eraser;
    }
    return null;
  }

  Product(
      {required this.uid,
      required this.description,
      required this.name,
      required this.price,
      required this.quantity,
      this.type,
      this.photoURL});

  Product.formMap({required Map<String, dynamic> userMap})
      : uid = userMap["uid"],
        description = userMap["dercription"],
        name = userMap["name"],
        price = userMap["price"],
        quantity = userMap["quantity"],
        type = userMap["type"],
        photoURL = userMap["photoURL"];

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'price': price,
        // ?? if left value is null, Will use value right side.
        'quantity': quantity,
        'description': description ?? "",
        'type': type ?? "",
        'photoURL': photoURL ?? ""
      };
}

// final Map<String,String> userInfo = {
//   "uid" : "123",
//   "email" : "123@gmail",
//   "username": "Fluke"
// };
