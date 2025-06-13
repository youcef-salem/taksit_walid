import 'package:flutter/material.dart';
import 'package:taksit_walid/model/customer.dart';

class Custumer extends StatelessWidget {
  final Customer custumer;
  final Size size;
  const Custumer({super.key, required this.custumer, required this.size});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                "${custumer.numerMonth}شهر",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Color.fromARGB(255, 67, 114, 185),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "(المتبقي :${custumer.id})",
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
          DecoratedBox(
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
        ],
      ),
    );
  }
}
