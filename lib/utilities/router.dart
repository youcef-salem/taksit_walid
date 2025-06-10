import 'package:flutter/material.dart';
import 'package:taksit_walid/utilities/routes.dart';
import 'package:taksit_walid/view/addproduct_page.dart';
import 'package:taksit_walid/view/product_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.add_product:
      return MaterialPageRoute(builder: (_) =>  AddproductPage());
    case Routes.product_list:
    return MaterialPageRoute(
      builder: (_) => const ProductPage(), // Replace with actual ProductListPage
    );
    default:
      return MaterialPageRoute(
        builder: (_) =>  AddproductPage(),
      );
  }
}