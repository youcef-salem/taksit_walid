import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 120),

                  Text(
                    'المنتجات',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
               SearchBar(
                hintText: 'ابحث عن منتج',
                onChanged: (value) {
                  // Implement search functionality here
                },
              backgroundColor: MaterialStateProperty.all(Color(0xFFF2F2F5)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
              )
                
                
                ),

              elevation: MaterialStateProperty.all(0)
              
              ),
              





             
            ],
          ),
        ),
      ),
    );
  }
}
