import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/widgets/price_dilog_card.dart';

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
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 8,
        child: Container(
          width: size.width * 0.9,
          constraints: BoxConstraints(
            maxHeight: size.height * 0.8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.grey.shade50,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with close button
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade600,
                        Colors.blue.shade400,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'تفاصيل المنتج والأقساط',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Product Information Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Name with Icon
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.blue.shade700,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      sc.sel_product.productName,
                                      style: theme.textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Product Description
                              
                              
                              
                              
                              // Price Cards
                              Row(
                                children: [
                                  Expanded(
                                    child: buildPriceCard(
                                    title:   'سعر الشراء',
                                     value:  '${sc.sel_product.buy_Price}',
                                    color:   Colors.green,
                                    icon:   Icons.trending_down_rounded,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: buildPriceCard(
                                   title:   'سعر البيع',
                                  value:     '${sc.sel_product.productPrice}',
                                    color:   Colors.orange,
                                    icon:   Icons.trending_up_rounded,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // Monthly Payment Card (reduced height)
                              Container(
                             padding: const EdgeInsets.all(8),
                                height: size.height*0.12,
                                child: buildPriceCard(
                               title:    'قيمة الدفعة الشهرية',
                               value:    '${sc.monthlyPayment}',
                                color:   Colors.blue,
                                  icon:    Icons.payments_outlined,
                                  isFullWidth: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Monthly Payments Section
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.blue.shade700,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'الأقساط الشهرية',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${sc.months_array.length} أقساط',
                                        style: TextStyle(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              Container(
                                height: 300, // Increased height to show all items
                                child: sc.months_array.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.receipt_long_outlined,
                                              size: 48,
                                              color: Colors.grey.shade400,
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              'لا توجد دفعات شهرية',
                                              style: theme.textTheme.bodyLarge?.copyWith(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        itemCount: sc.months_array.length,
                                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                                        itemBuilder: (context, index) {
                                          final m = sc.months_array[index];
                                          final isPaid = m.time_payment != null && 
                                                         m.time_payment!.isNotEmpty;
                                          
                                          return Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: isPaid
                                                    ? [Colors.green.shade50, Colors.green.shade100]
                                                    : [Colors.orange.shade50, Colors.orange.shade100],
                                              ),
                                              borderRadius: BorderRadius.circular(16),
                                              border: Border.all(
                                                color: isPaid
                                                    ? Colors.green.shade200
                                                    : Colors.orange.shade200,
                                                width: 1,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(12),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    color: isPaid
                                                        ? Colors.green.shade200
                                                        : Colors.orange.shade200,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Icon(
                                                    isPaid
                                                        ? Icons.check_circle_outline
                                                        : Icons.schedule_outlined,
                                                    color: isPaid
                                                        ? Colors.green.shade800
                                                        : Colors.orange.shade800,
                                                    size: 18,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'القسط رقم ${m.numner_of_pay}',
                                                        style: theme.textTheme.bodyLarge?.copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.grey.shade800,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.event_outlined,
                                                            size: 16,
                                                            color: Colors.grey.shade600,
                                                          ),
                                                          const SizedBox(width: 4),
                                                          Text(
                                                            'تاريخ الاستحقاق: ${m.deadligne}',
                                                            style: theme.textTheme.bodySmall?.copyWith(
                                                              color: Colors.grey.shade600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      if (isPaid) ...[
                                                        const SizedBox(height: 4),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.check_circle,
                                                              size: 16,
                                                              color: Colors.green.shade700,
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Text(
                                                              'تم الدفع: ${m.time_payment}',
                                                              style: theme.textTheme.bodySmall?.copyWith(
                                                                color: Colors.green.shade700,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Close Button
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade600,
                                Colors.grey.shade700,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'إغلاق',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}