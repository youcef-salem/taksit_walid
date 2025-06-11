import 'package:taksit_walid/model/txt_addproduct.dart';

class ProductList {
  final List<product> products;

  ProductList(this.products);

  void addProduct(product product) {
    products.add(product);
   
  }

  void removeProduct(product product) {
    products.remove(product);
  }

  List<product> getProducts() {
    return products;
  }






  
}