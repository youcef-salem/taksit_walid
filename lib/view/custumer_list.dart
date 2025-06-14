import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/widgets/custumer.dart';

class CustumerList extends StatelessWidget {
  Customer sc = Customer(
    id: 1,
    name: "عمر",
    phone_number: "0791556965",
    
    numerMonth: 12,
    monthlyPayment: 300,
    sel_product: product(productName: "", buy_Price: 200, productPrice: 300, productDescription: "productDescription")
  );
  CustumerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 120),
                Text(
                  "الزبائن",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              
              children: [
                Custumer(custumer: sc, size: MediaQuery.of(context).size),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
