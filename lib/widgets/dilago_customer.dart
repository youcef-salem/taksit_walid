import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/model/txt_addproduct.dart';
import 'package:taksit_walid/model/months_topay.dart';

class ProductWithMonthsDialog extends StatelessWidget {
  final Customer sc;
  final Size size;
  const ProductWithMonthsDialog({
    super.key,
    required this.sc,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Info
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    sc.sel_product.productName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sc.sel_product.productDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Chip(
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('سعر الشراء: '),
                              Text("${sc.sel_product.buy_Price}"),
                            ],
                          ),
                          backgroundColor: Colors.green.shade50,
                          labelStyle: const TextStyle(color: Colors.green),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Chip(
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('سعر البيع:'),
                              Text("${sc.sel_product.productPrice}"),
                            ],
                          ),
                          backgroundColor: Colors.red.shade50,
                          labelStyle: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                   Container(
                   
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Chip(
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('فيمة الدفعة'),
                              Text("${sc.monthlyPayment}"),
                            ],
                          ),
                          backgroundColor: Colors.red.shade50,
                          labelStyle: const TextStyle(color: Colors.lightBlue),
                        ),
                      ),

                  const SizedBox(height: 12),
                  SizedBox(
                    height: 250, // Adjust as needed
                    child: sc.months_array.isEmpty
                        ? Center(
                            child: Text(
                              'لا توجد دفعات شهرية',
                              style: theme.textTheme.bodyMedium,
                            ),
                          )
                        : ListView.separated(
                            itemCount: sc.months_array.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 16),
                            itemBuilder: (context, index) {
                              final m = sc.months_array[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'الدفعة رقم: ${m.numner_of_pay}',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'تاريخ الاستحقاق: ${m.deadligne}',
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        if (m.time_payment != null &&
                                            m.time_payment!.isNotEmpty)
                                          Text(
                                            'تاريخ الدفع: ${m.time_payment}',
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  color: Colors.blueGrey,
                                                ),
                                          ),
                                      ],
                                    ),
                                    // You can add icons or status here if needed, but not is_payed
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('إغلاق'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
