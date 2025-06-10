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
                    ),
                    MainButton(
                      txt: 'إضافة',
                      size: MediaQuery.of(context).size,
                      onPressed: () => prControler.onpressed(context)
                       
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
