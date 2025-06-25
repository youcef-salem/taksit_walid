import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taksit_walid/controlers/providers.dart';
import 'package:taksit_walid/model/txt_addproduct.dart' as type;
import 'package:taksit_walid/widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.add),
                SizedBox(width: 120),

                Text(
                  'المنتجات',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SearchBar(
              hintText: 'ابحث عن منتج',
              onChanged: (value) {
                // Implement search functionality here
              },
              backgroundColor: MaterialStateProperty.all(Color(0xFFF2F2F5)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),

              elevation: MaterialStateProperty.all(0),
            ),
            const SizedBox(height: 30),
            Consumer(
              builder: (context, prtList, _) {
                final productList = prtList.watch(productListProvider);
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,

                    itemCount: productList
                        .products
                        .length, // Adjust this to the number of products you have
                    itemBuilder: (context, index) => ProductCard(
                      product: type.product(
                        productName: productList.products[index].productName,
                        productPrice: productList.products[index].productPrice,
                        buy_Price: productList.products[index].buy_Price,
                        productDescription:
                            productList.products[index].productDescription,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
