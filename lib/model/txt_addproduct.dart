

import 'dart:math';

class product {
  // This class is currently empty, but you can add properties and methods as needed.
  // For example, you might want to add fields for product details and methods to handle adding a product.

  // Example property
  String productName;
  double buy_Price;
  double productPrice;
  final  int   id; 
  String productDescription;

  // Constructor
  product({
    int? id,
    required this.productName,
    required this.buy_Price,
    required this.productPrice,
    required this.productDescription,
  }) : this.id = id ?? DateTime.now().millisecondsSinceEpoch + Random().nextInt(1000);
  @override
  String toString() {
    return 'Product Name: $productName, Buy Price: $buy_Price, Price: $productPrice, Description: $productDescription';
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'buy_Price': buy_Price,
      'productPrice': productPrice,
      'productDescription': productDescription,
    };
  }

  factory product.fromMap(Map<String, dynamic> map) {
    return product(
      productName: map['productName'],
      buy_Price: map['buy_Price'],
      productPrice: map['productPrice'],
      productDescription: map['productDescription'],
    );
  }
}
