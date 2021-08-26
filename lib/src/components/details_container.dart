import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String? text;

  const DetailsContainer({Key? key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(text!),
        ),
      ),
    );
  }
}
