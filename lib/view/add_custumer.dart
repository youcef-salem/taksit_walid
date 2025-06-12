import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taksit_walid/controlers/add_costumer.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';


class AddCustumer extends StatelessWidget {
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   AddCustumer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<AddCustomer>(
      builder: (context, customerCont, _) {
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
                      hintText:  "ادخل اسم الزبون",
                      labelText:  "اسم الزبون",
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
                      hintText:   "ادخل رقم المنتج",
                      labelText: "رقم المنتج",
                     
                      size: MediaQuery.of(context).size,
                    validator: (p0) => customerCont.validateIdProduct(p0!),
                      controller: customerCont.id_product_controler,
                    ),
                    txtFiled_add(
                      hintText: "ادخل  عدد الأشهر",
                      labelText: "عدد الأشهر",
                     
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validateNumberMonth(p0!),
                      controller: customerCont.numberMonth_controler,
                     
                    ),
                    txtFiled_add(
                      hintText: "ادخل قيمة القسط الشهري",
                      labelText: "قيمة القسط الشهري",
                     
                      size: MediaQuery.of(context).size,
                      validator: (p0) => customerCont.validateMonthlyPayment(p0!),
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
                    
                        MainButton(
                          txt: 'إضافة',
                          size: MediaQuery.of(context).size,
                          onPressed: ()=> {
                            if (formKey.currentState!.validate()) {
                              customerCont.onPressed(context),
                              
                              
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