import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taksit_walid/view_models/add_costumer.dart';
import 'package:taksit_walid/view_models/list_cusumer.dart';
import 'package:taksit_walid/view_models/product_list.dart';
import 'package:taksit_walid/view_models/txt_filed_addproduct.dart';


final AddproductProvider = ChangeNotifierProvider((ref) => TxtFiledAddproduct());
final productListProvider = ChangeNotifierProvider((ref) => ProductList());
final addCustomerProvider = ChangeNotifierProvider((ref) => AddCustomer());
final listCusumerProvider = ChangeNotifierProvider((ref) => ListCusumer());