import 'package:flutter/material.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';

class TxtFiledAddproduct with ChangeNotifier {
  TxtFiledAddproduct() {
    // Initialize controllers with empty values
    nameController.addListener(_controllerListener);
    priceController.addListener(_controllerListener);
    descriptionController.addListener(_controllerListener);
    imageUrlController.addListener(_controllerListener);
    categoryController.addListener(_controllerListener);
  }

  void _controllerListener() {
    notifyListeners();
  }

  product pr = product(
    productName: '',
    productPrice: 0.0,
    productDescription: '',
    productImageUrl: '',
    productCategory: 'bbb',
  );
  final formKey = GlobalKey<FormState>();
  // Unique keys for each field

  // Text editing controllers
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageUrlController = TextEditingController();
  final categoryController = TextEditingController();

  // Method to clear all text fields
  void clearFields() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    imageUrlController.clear();
    categoryController.clear();
    notifyListeners();
  }

  // Method to create a product object from the form data
  void setproductDetails() {
    pr = product(
      productName: nameController.text,
      productPrice: double.tryParse(priceController.text) ?? 0.0,
      productDescription: descriptionController.text,
      productImageUrl: imageUrlController.text == '' ? 'hhhh' : imageUrlController.text,
      productCategory: categoryController.text,
    );
    notifyListeners();
  }

  void set productDetailst(product p) {
    nameController.text = p.productName;
    priceController.text = p.productPrice.toString();
    descriptionController.text = p.productDescription;
    imageUrlController.text = p.productImageUrl;
    categoryController.text = p.productCategory;
    notifyListeners();
  }

  // Validation methods
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Product name is required';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid price';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    }
    return null;
  }

  String? validateImageUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Image URL is required';
    }
    // Add URL validation if needed
    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category is required';
    }
    return null;
  }

  // Method to check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    nameController.removeListener(_controllerListener);
    priceController.removeListener(_controllerListener);
    descriptionController.removeListener(_controllerListener);
    imageUrlController.removeListener(_controllerListener);
    categoryController.removeListener(_controllerListener);

    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageUrlController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}