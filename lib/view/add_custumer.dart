import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taksit_walid/controlers/add_costumer.dart';
import 'package:taksit_walid/controlers/list_cusumer.dart';
import 'package:taksit_walid/controlers/product_list.dart';

import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';

class AddCustumer extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddCustumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCustomer>(
      builder: (context, customerCont, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Center(
                      child: Text(
                        "اضافة زبون",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Consumer<ProductList>(
                      builder: (context, productList, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainButton(
                              txt: "اختر منتج",
                              size: MediaQuery.of(context).size,
                              widh_pref: 0.4,
                              onPressed: () async {
                                final result = await showDialog<product>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.8,
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'اختر منتج',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    productList.products.length,
                                                itemBuilder: (context, index) {
                                                  final product = productList
                                                      .products[index];
                                                  return Card(
                                                    elevation: 0,
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 4,
                                                        ),
                                                    child: ListTile(
                                                      title: Text(
                                                        product.productName,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        'السعر: ${product.productPrice}',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey
                                                              .shade700,
                                                        ),
                                                      ),
                                                      onTap: () =>
                                                          Navigator.pop(
                                                            context,
                                                            product,
                                                          ),
                                                      trailing: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 10,
                                                    ),
                                              ),
                                              child: const Text(
                                                'إلغاء',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                customerCont.set_selcetd_pr(result);
                              },
                            ),
                            if (customerCont.selected_product != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  "سعر البيع: ${customerCont.selected_product!.productPrice}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    txtFiled_add(
                      hintText: "ادخل اسم الزبون",
                      labelText: "اسم الزبون",
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validateName(p0!),
                      controller: customerCont.nameController,
                    ),
                    txtFiled_add(
                      hintText: 'ادخل رقم الهاتف',
                      labelText: 'رقم الهاتف',
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validatePhoneNumber(p0!),
                      controller: customerCont.number_controler,
                    ),

                    txtFiled_add(
                      hintText: "ادخل عدد الأشهر",
                      labelText: "عدد الأشهر",
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validateNumberMonth(p0!),
                      controller: customerCont.numberMonth_controler,
                      onChanged: (p0) =>
                          customerCont.set_montgh_pay(double.tryParse(p0)),
                    ),
                    txtFiled_add(
                      hintText: "ادخل قيمة القسط الشهري",
                      labelText: "قيمة القسط الشهري",
                      size: MediaQuery.of(context).size,
                      validator: (p0) =>
                          customerCont.validateMonthlyPayment(p0!),
                      controller: customerCont.MonthlyPayment_controler,
                    ),
                    txtFiled_add(
                      hintText: "ادخل وصف الزبون",
                      labelText: "وصف الزبون",
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validateDescription(p0!),
                      controller: customerCont.description_controler,
                      maxligne: 2,
                    ),
                    const SizedBox(height: 20),
                    Consumer<ListCusumer>(
                      builder: (_, value, __) => MainButton(
                        txt: 'إضافة',
                        size: MediaQuery.of(context).size,
                        onPressed: ()  {
                          if (formKey.currentState!.validate()) {
                            customerCont.onPressed(context);
                            value.add_customer(customerCont.cureentCustomer!);
                           
                           
                          }
                        },
                      ),
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
