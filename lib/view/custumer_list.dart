import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:taksit_walid/controlers/providers.dart';
import 'package:taksit_walid/widgets/custumer.dart';

class CustumerList extends ConsumerWidget {
  CustumerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(listCusumerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: val.setlist, icon: Icon(Icons.add)),

                Text(
                  "الزبائن",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(onPressed: val.setlist, icon: Icon(Icons.refresh)),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: val.lista.length,
                  itemBuilder: (context, index) {
                    return Custumer(
                      onPay: val.paying,
                      custumer: val.lista[index],
                      size: MediaQuery.of(context).size,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
