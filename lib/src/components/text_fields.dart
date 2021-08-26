import 'package:flutter/material.dart';

class TextFieldsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3.0),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
