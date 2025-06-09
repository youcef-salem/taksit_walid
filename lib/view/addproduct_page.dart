import 'package:flutter/material.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';

class AddproductPage extends StatelessWidget {
  const AddproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Add Scaffold here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.8, // Adjusted height
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 50), // Add some top padding
              txtFiled_add(
                hintText: 'Enter product name',
                labelText: 'Product Name',
                size: MediaQuery.of(context).size,
              ),
              txtFiled_add(
                hintText: 'Enter product price',
                labelText: 'Product Price',
                size: MediaQuery.of(context).size,
              ),
              txtFiled_add(
                hintText: 'Enter product description',
                labelText: 'Product Description',
                size: MediaQuery.of(context).size,
              ),
              txtFiled_add(
                hintText: 'Enter product image URL',
                labelText: 'Product Image URL',
                size: MediaQuery.of(context).size,
              ),
              txtFiled_add(hintText: "Enter product category", labelText: "Product Category",
                size:  MediaQuery.of(context).size,),

              txtFiled_add(
                hintText: 'Enter product image URL',
                labelText: 'Product Image URL',
                size: MediaQuery.of(context).size,
              )
,
              MainButton(txt: 'Submit', size: MediaQuery.of(context).size,)
            ],
          ),
        ),
      ),
    );
  }
}