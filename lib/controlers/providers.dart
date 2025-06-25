import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taksit_walid/controlers/add_costumer.dart';
import 'package:taksit_walid/controlers/list_cusumer.dart';
import 'package:taksit_walid/controlers/product_list.dart';
import 'package:taksit_walid/controlers/txt_filed_addproduct.dart';


final AddproductProvider = ChangeNotifierProvider((ref) => TxtFiledAddproduct());
final productListProvider = ChangeNotifierProvider((ref) => ProductList());
final addCustomerProvider = ChangeNotifierProvider((ref) => AddCustomer());
final listCusumerProvider = ChangeNotifierProvider((ref) => ListCusumer());