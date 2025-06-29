import 'package:flutter/material.dart';
import 'package:taksit_walid/utilities/routes.dart';
import 'package:taksit_walid/view/addproduct_page.dart';
import 'package:taksit_walid/view/custumer_list.dart';
import 'package:taksit_walid/view/product_page.dart';
import 'package:taksit_walid/widgets/nav_bar.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.add_product:
      return MaterialPageRoute(builder: (_) => AddproductPage());
    case Routes.product_list:
      return MaterialPageRoute(
        builder: (_) =>
            const ProductPage(), // Replace with actual ProductListPage
      );
    case Routes.navbar:
      return MaterialPageRoute(builder: (_) => NavBar());
    case Routes.add_costumer:
      return MaterialPageRoute(
        builder: (_) => CustumerList(), // Replace with actual AddCustumer page
      );

    case Routes.costumer_list:
      return MaterialPageRoute(builder: (_) => CustumerList());

    default:
      return MaterialPageRoute(builder: (_) => CustumerList());
  }
}
