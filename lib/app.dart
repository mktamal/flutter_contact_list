import 'package:contact_list/ui/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      home: const ContactListScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            fixedSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
