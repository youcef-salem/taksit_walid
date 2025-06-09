import 'package:flutter/material.dart';
import 'package:taksit_walid/view/addproduct_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey[600]),
            // Add these properties for error styling
            errorStyle: TextStyle(color: Colors.red, fontSize: 12),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color:Color(0xFF61758A)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Color(0xFF61758A)),
            ),

            // Existing properties
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Color(0xFF61758A)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:Color(0xFF61758A)),
            ),
          ),
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
      home: AddproductPage() ,
        
    );
  }
}