import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';
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
                    color: Color(0xFF121417),
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

                Text(
                  custumer.phone_number,

                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onPay(custumer),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F5),
            
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
