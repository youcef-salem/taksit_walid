import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taksit_walid/controlers/txt_filed_addproduct.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';

class AddproductPage extends StatelessWidget {
  const AddproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TxtFiledAddproduct>(
      builder: (context, prControler, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: prControler.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    txtFiled_add(
                      hintText: 'Enter product name',
                      labelText: 'Product Name',
                      size: MediaQuery.of(context).size,
                      validator: prControler.validateName,
                      controller: prControler.nameController,
                    ),
                    txtFiled_add(
                      hintText: 'Enter product price',
                      labelText: 'Product Price',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validatePrice(p0!),
                      controller: prControler.priceController,
                    ),
                    txtFiled_add(
                      hintText: 'Enter product description',
                      labelText: 'Product Description',
                      size: MediaQuery.of(context).size,
                      validator: (p0) =>  prControler.validateDescription(p0!),
                      controller: prControler.descriptionController,
                    ),
                    txtFiled_add(
                      hintText: 'Enter product image URL',
                      labelText: 'Product Image URL',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validateImageUrl(p0!), 
                      controller: prControler.imageUrlController,
                    ),
                    txtFiled_add(
                      hintText: "Enter product category",
                      labelText: "Product Category",
                      size:  MediaQuery.of(context).size,
                      validator: (p0) => prControler.validateCategory(p0!),
                      controller: prControler.categoryController,
                    ),
                   
                    MainButton(
                      txt: 'submit',
                      size: MediaQuery.of(context).size,
                      onPressed: () {
                       
                        if (prControler.validateForm()) {
                          
                         
                          
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

