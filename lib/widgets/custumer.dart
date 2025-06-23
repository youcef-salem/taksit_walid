import 'package:flutter/material.dart';

import 'package:taksit_walid/model/customer.dart';
import 'package:taksit_walid/utilities/luncher.dart';
import 'package:taksit_walid/widgets/dilago_customer.dart';

class Custumer extends StatelessWidget {
  final Customer custumer;
  final Size size;
  final void Function(Customer) onPay;
  const Custumer({super.key,
 required this.onPay,
   required this.custumer, required this.size});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return ProductWithMonthsDialog(
               size: size,
               sc:  custumer,
                );
              },
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  custumer.name,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color:  !custumer.months_array.isEmpty ?   (custumer.months_array.first.is_payed? Colors.red: Color(0xFF121417)) : Colors.black ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "الاشهر المتبقية" + " ${custumer.numerMonth} ",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Color.fromARGB(255, 67, 114, 185),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "(${custumer.months_array.isEmpty?"لا يوجد اشهر ":(custumer.months_array.first.deadligne)})",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Color.fromARGB(255, 218, 13, 44),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                TextButton(
                  onPressed:()=> Luncher.luncher(custumer.phone_number.toString(),Luncher.extension) ,
                  child: Text(
                    custumer.phone_number,
                  
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          InkWell(
            onTap: () => 
            showDialog(context: context, builder: (context){
                return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                    Icons.payment_rounded,
                    color: Colors.blueAccent,
                    size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                    "تأكيد الدفع",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                    "هل أنت متأكد أنك تريد تأكيد عملية الدفع لهذا العميل؟",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Row(
                    children: [
                      Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded, color: Colors.white),
                        label: Text(
                        'إغلاق',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>{
                          onPay(custumer),
                          Navigator.pop(context)
                          },
                        icon: const Icon(Icons.check_circle, color: Colors.white),
                        label: Text(
                        "تأكيد الدفع",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                      ),
                    ],
                    ),
                  ],
                  ),
                ),
                );
            } )
          ,
            child: DecoratedBox(
              decoration: BoxDecoration(
               color:  !custumer.months_array.isEmpty ?   (custumer.months_array.first.is_payed? Colors.red: Color(0xFF121417)) :  Color(0xFFF2F2F5),
              
            
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  right: 29,
                  left: 29,
                ),
                child: Text(
                  'الدفع',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Color(0xFF121417),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
