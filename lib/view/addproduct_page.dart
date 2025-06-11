import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taksit_walid/controlers/txt_filed_addproduct.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/services/data_base.dart';
import 'package:taksit_walid/widgets/main_button.dart';
import 'package:taksit_walid/widgets/txt_filed.dart';

class AddproductPage extends StatefulWidget {
  AddproductPage({super.key});

  @override
  State<AddproductPage> createState() => _AddproductPageState();
}

class _AddproductPageState extends State<AddproductPage> {
  Future<product> show_produdct_saved() async {
    try {
      var productSaved = await db_class.getProducts(database);
      return product.fromMap(productSaved.first);
    } catch (e) {
      debugPrint('Error retrieving product: $e');
      return product(
        productName: 'خطأ',
        productPrice: 0.0,
        productDescription: 'لم يتم حفظ المنتج',
        buy_Price: 0.0,
      );
    }
  }

  product pr = product(
    productName: 'dddd',
    productPrice: 0.0,
    productDescription: '',
    buy_Price: 0.0,
  );
  dataBase_products db_class = dataBase_products();
  late Database database;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  Future<void> initDatabase() async {
    database = await db_class.openbase_product();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TxtFiledAddproduct>(
      builder: (context, prControler, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
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
                    SizedBox(height: 40),
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
                    MainButton(
                      txt: 'إضافة',
                      size: MediaQuery.of(context).size,

                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            prControler
                                .setproductDetails(); // Set details first
                            debugPrint(
                              'Product details before insert: ${prControler.pr.toMap()}',
                            );

                            await db_class.insertProduct(
                              database,
                              prControler.pr.toMap(),
                            );
                            debugPrint('Product inserted successfully');

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إضافة المنتج بنجاح'),
                              ),
                            );

                            // Clear fields after successful insertion
                            prControler.clearFields();

                            // Verify insertion by retrieving
                            var saved = await show_produdct_saved();
                            debugPrint(
                              'Retrieved product: ${saved.toString()}',
                            );
                          } catch (e) {
                            debugPrint('Error inserting product: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('خطأ في إضافة المنتج: $e'),
                              ),
                            );
                          }
                        }
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
