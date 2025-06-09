class product {
  // This class is currently empty, but you can add properties and methods as needed.
  // For example, you might want to add fields for product details and methods to handle adding a product.
  
  // Example property
  String productName;
  double productPrice;
  String productDescription;
  String productImageUrl;
  String productCategory ;

  // Constructor
  product({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImageUrl,
    required this.productCategory,
  });
  @override
  String toString() {
    // TODO: implement toString

    return  'Product Name: $productName, Price: $productPrice, Description: $productDescription, Image URL: $productImageUrl, Category: $productCategory';
  }




  // Example method
 
  
}