import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taksit_walid/controlers/list_cusumer.dart';
import 'package:taksit_walid/widgets/custumer.dart';

class CustumerList extends StatelessWidget {
  CustumerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ListCusumer>(
        builder: (context, val, child) => 
         Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                children: [
                  IconButton(
                    onPressed: val.setlist ,
                    icon:  Icon(Icons.add)),
                  SizedBox(width: 120),
                  Text(
                    "الزبائن",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
      ),
    );
  }
}
