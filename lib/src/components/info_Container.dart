import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String text;

  const InfoContainer({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Theme.of(context).primaryColor,
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
