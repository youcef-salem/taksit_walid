import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/widgets/custumer.dart';

class CustumerList extends StatefulWidget {
  CustumerList({super.key});

  @override
  State<CustumerList> createState() => _CustumerListState();
}

class _CustumerListState extends State<CustumerList> {
  late Customer sc;
  late Customer second;
  @override
  void initState() {
    sc = Customer(
      id: 1,
      name: "عمر",
      phone_number: "0791556965",
      numerMonth: 12,
      monthlyPayment: 300,
      sel_product: product(
        productName: "tichert",
        buy_Price: 200,
        productPrice: 300,
        productDescription: "productDescription",
      ),
    );
    sc.set_months();
    second = Customer(
      sel_product: product(
        productName: "nioma",
        buy_Price: 90,
        productPrice: 100,
        productDescription: '',
      ),
      id: 3,
      name: 'mohamed',
      phone_number: '07666666',
      numerMonth: 4,
      monthlyPayment: 500,
    );
    second.set_months();
    super.initState();
  }

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
                // First customer view with month details
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: sc.months_array.length,
                            itemBuilder: (context, index) {
                              return Text(sc.months_array[index].toString());
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  child: Custumer(
                    custumer: sc,
                    size: MediaQuery.of(context).size,
                  ),
                ),
                SizedBox(height: 20),
                // Second customer view with product information
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return  AlertDialog(
                        content: Container(
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: second.months_array.length,
                            itemBuilder: (context, index) {
                              return Text(second.months_array[index].toString());
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  child: Custumer(
                    custumer: second,
                    size: MediaQuery.of(context).size,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
