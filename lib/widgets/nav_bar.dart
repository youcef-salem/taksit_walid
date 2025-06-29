import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:taksit_walid/view/add_custumer.dart';

import 'package:taksit_walid/view/addproduct_page.dart';
import 'package:taksit_walid/view/custumer_list.dart';
import 'package:taksit_walid/view/product_page.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen:  CustumerList(),
            item: ItemConfig(
              icon: Icon(Icons.currency_exchange),
              title: "الزبائن ",
            ),
          ),
          PersistentTabConfig(
            screen: AddCustumer(),
            item: ItemConfig(
              icon: Icon(Icons.person_add_rounded),
              title: "اضافة زبون ",
            ),
          ),

          PersistentTabConfig(
            screen: ProductPage(),
            item: ItemConfig(
              icon: Icon(Icons.shopping_cart),
              title: "المنتجات",
            ),
          ),
          PersistentTabConfig(
            screen: AddproductPage(),
            item: ItemConfig(
              icon: Icon(Icons.add_shopping_cart_outlined),
              title: "اضافة منتج",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(),
        ),
      ),
    );
  }
}
