class product {
  // This class is currently empty, but you can add properties and methods as needed.
  // For example, you might want to add fields for product details and methods to handle adding a product.

  // Example property
  String productName;
  double buy_Price;
  double productPrice;
  
  String productDescription;

  // Constructor
  product({
    required this.productName,
    required this .buy_Price,
    required this.productPrice,
    
    required this.productDescription,
  });
  @override
  String toString() {
    // TODO: implement toString

    return 'Product Name: $productName, Buy Price: $buy_Price, Price: $productPrice, Description: $productDescription';
  }

  // Example method
}
