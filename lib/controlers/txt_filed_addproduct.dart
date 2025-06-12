import 'package:flutter/material.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';

class TxtFiledAddproduct with ChangeNotifier {
  
  
  TxtFiledAddproduct() {
    // Initialize controllers with empty values
    nameController.addListener(_controllerListener);
    buy_price_controler.addListener(_controllerListener);
    descriptionController.addListener(_controllerListener);
    price_controler.addListener(_controllerListener);
    
  }

  void _controllerListener() {
    notifyListeners();
  }
   void sell_price (double value) {
   buy_price_controler.text = (value + 6* value / 10).toString();
   
    notifyListeners();
  }

  product pr = product(
    productName: '',
    productPrice: 0.0,
    productDescription: '',
    buy_Price: 0.0,
   
    
  );
  
  // Unique keys for each field

  // Text editing controllers
  final nameController = TextEditingController();
  final buy_price_controler = TextEditingController();
  final descriptionController = TextEditingController();
  final price_controler = TextEditingController();
 

  // Method to clear all text fields
  void clearFields() {
    nameController.clear();
    buy_price_controler.clear();
    descriptionController.clear();
    price_controler.clear();
    
    notifyListeners();
  }

  // Method to create a product object from the form data
  void setproductDetails() {
    pr = product(
      productName: nameController.text,
      productPrice: double.tryParse(buy_price_controler.text) ?? 0.0,
      productDescription: descriptionController.text,
      buy_Price: double.tryParse(price_controler.text) ?? 0.0,
      
    );
    notifyListeners();
  }

  

  // Validation methods
  String? validateName(String? value) {
    if (value!.isEmpty ||
        value.trim().isEmpty ||
        value.length < 3 ||
        value.contains(RegExp(r'\s{2,}')) // Check for multiple spaces
    ){
      if (value.isEmpty) {
        return 'اسم المنتج مطلوب';
      } else if (value.trim().isEmpty) {
        return 'لا يمكن أن يكون اسم المنتج عبارة عن مسافات فقط';
      } else if (value.length < 3) {
        return 'يجب أن يتكون اسم المنتج من 3 أحرف على الأقل';
     
      } else if (value.contains(RegExp(r'\s{2,}'))) {
        return 'لا يمكن أن يحتوي اسم المنتج على مسافات متتالية';
      }
     
    }
    
    return null;
  }
String ? validateDescription(String? value) {
    
    return null;
  }
  String? validatePrice(String? value) {
   
    if (value == null || value.isEmpty ||
    value.trim().isEmpty ||
        double.tryParse(value) == null ||
        double.tryParse(value)! <= 0.0
      ) {
      if (value == null || value.isEmpty) {
        return 'السعر مطلوب';
      } else if (value.trim().isEmpty) {
        return 'لا يمكن أن يكون السعر عبارة عن مسافات فقط';
      } else if (double.tryParse(value) == null) {
        return 'يجب أن يكون السعر رقمًا صحيحًا';
      } else if (double.tryParse(value)! <= 0.0) {
        return 'يجب أن يكون السعر أكبر من صفر';
      }
    }
    
    
    return null;
  }
void onpressed(BuildContext context) {
     debugPrint('Button pressed');
                        if (validateForm()) {
                          
                          setproductDetails();
                      debugPrint('Product details befor dta base set: ${pr.productName}, ${pr.productPrice}, ${pr.buy_Price}, ${pr.productDescription}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                'تم إضافة المنتج: ${pr.productName}',
                              ),
                            ),
                          );
                         clearFields();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('يرجى ملء جميع الحقول بشكل صحيح'),
                            ),
                          );
                        }
                      }
  
 
 


  // Method to check if form is valid

    bool validateForm() {
  // First check form's current state
  
    // If form is valid, run our additional validations
    return validateName(nameController.text) == null &&
           validatePrice(price_controler.text) == null &&
           validatePrice(buy_price_controler.text) == null &&
           validateDescription(descriptionController.text) == null;
  
}
 

  @override
  void dispose() {
    nameController.removeListener(_controllerListener);
    buy_price_controler.removeListener(_controllerListener);
    descriptionController.removeListener(_controllerListener);
    price_controler.removeListener(_controllerListener);
    
   
    nameController.dispose();
    buy_price_controler.dispose();
    descriptionController.dispose();
    price_controler.dispose();
    
    super.dispose();
  }
}