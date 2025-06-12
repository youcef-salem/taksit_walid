import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';

class AddCustomer with ChangeNotifier {
  Customer? cureentCustomer;

  final nameController = TextEditingController();
  final number_controler = TextEditingController();
  final description_controler = TextEditingController();
  final numberMonth_controler = TextEditingController();
  final id_product_controler = TextEditingController();
  final MonthlyPayment_controler = TextEditingController();
  AddCustomer() {
    // Initialize controllers with empty values
    nameController.addListener(_controllerListener);
    number_controler.addListener(_controllerListener);
    numberMonth_controler.addListener(_controllerListener);
    description_controler.addListener(_controllerListener);
    id_product_controler.addListener(_controllerListener);
    MonthlyPayment_controler.addListener(_controllerListener);

  }
  void _controllerListener() {
    notifyListeners();
  }

  void clearFields() {
    nameController.clear();
    number_controler.clear();
    description_controler.clear();
    numberMonth_controler.clear();
    id_product_controler.clear();
    MonthlyPayment_controler.clear();
    cureentCustomer = null; 
    notifyListeners();
  }

  int generateId() {
    return DateTime.now().millisecondsSinceEpoch.toInt();
  }

  void setCustomerDetails() {
    cureentCustomer = Customer(
      id: generateId(),
      name: nameController.text,
      phone_number: int.tryParse(number_controler.text) ?? 0,
      description: description_controler.text,
      numerMonth: int.tryParse(numberMonth_controler.text) ?? 0,
      monthlyPayment: 0.0, // Assuming you will set this later
      id_product: 0, // Assuming you will set this later
    );
    notifyListeners();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال اسم الزبون';
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length < 10) {
      return 'رقم الهاتف يجب أن يكون 10 أرقام على الأقل';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
    }
    if (!value.startsWith('0')) {
      return 'رقم الهاتف يجب أن يبدأ بصفر';
    }
    if (value.length > 10) {
      return 'رقم الهاتف يجب أن يكون10 رقمًا ';
    }

    return null;
  }
  String? validateNumberMonth(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال عدد الأشهر';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'عدد الأشهر يجب أن يكون رقمًا صحيحًا أكبر من 0';
    }

    return null;
  }
  String? validateDescription(String value) {
    
    return null;
  }
  
  String? validateMonthlyPayment(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال المبلغ الشهري';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'المبلغ الشهري يجب أن يكون رقمًا صحيحًا أكبر من 0';
    }

    return null;
  }
  String? validateIdProduct(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال رقم المنتج';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'رقم المنتج يجب أن يكون رقمًا صحيحًا أكبر من 0';
    }


    return null;
  }



  bool validateForm() {
  // First check form's current state
  
    // If form is valid, run our additional validations
    return validateName(nameController.text) == null &&
           validatePhoneNumber(number_controler.text) == null &&
           
           validateNumberMonth(numberMonth_controler.text) == null &&
           validateDescription(description_controler.text) == null
           && validateMonthlyPayment(numberMonth_controler.text) == null
           && validateIdProduct(numberMonth_controler.text) == null;
}
  void onPressed(BuildContext context) {
    debugPrint('Button pressed');
    if (validateForm()) {
      setCustomerDetails();
      debugPrint('Customer details before database set: ${cureentCustomer?.name}, ${cureentCustomer?.phone_number}, ${cureentCustomer?.description}, ${cureentCustomer?.numerMonth}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'تم إضافة الزبون: ${cureentCustomer?.name}',
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




















}
