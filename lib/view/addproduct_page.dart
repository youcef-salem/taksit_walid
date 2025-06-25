import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taksit_walid/view_models/providers.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';

class AddproductPage extends ConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddproductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, prCon, _) {
        final prControler = prCon.watch(AddproductProvider);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey, // Use provider's form key instead
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'اضافة المنتج',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    txtFiled_add(
                      hintText: 'ادخل اسم المنتج',
                      labelText: 'اسم المنتج',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validateName(p0!),
                      controller: prControler.nameController,
                    ),
                    txtFiled_add(
                      hintText: 'ادخل سعر الشراء',
                      labelText: 'سعر الشراء',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validatePrice(p0!),
                      controller: prControler.price_controler,
                      onChanged: (p0) =>
                          prControler.sell_price(double.tryParse(p0) ?? 0.0),
                    ),
                    txtFiled_add(
                      hintText: 'ادخل سعر البيع',
                      labelText: 'سعر البيع',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validatePrice(p0!),
                      controller: prControler.buy_price_controler,
                    ),
                    txtFiled_add(
                      hintText: "ادخل وصف المنتج",
                      labelText: "وصف المنتج",
                      size: MediaQuery.of(context).size,
                      validator: (p0) => prControler.validateDescription(p0!),
                      controller: prControler.descriptionController,
                      maxligne: 2,
                    ),
                    const SizedBox(height: 20),
                    Consumer(
                      builder: (context, prList, _) {
                        final productList = prList.watch(productListProvider);
                        return MainButton(
                          txt: 'إضافة',
                          size: MediaQuery.of(context).size,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              prControler.onpressed(context);
                              productList.addProduct(
                                product(
                                  productName: prControler.pr.productName,
                                  buy_Price: prControler.pr.buy_Price,
                                  productPrice: prControler.pr.productPrice,

                                  productDescription:
                                      prControler.pr.productDescription,
                                ),
                              );
                              prControler.clearFields();
                            }
                          },
                        );
                      },
                    ),
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
