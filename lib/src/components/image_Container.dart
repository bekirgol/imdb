import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String img;

  const ImageContainer({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Image.network(
        this.img,
        fit: BoxFit.fill,
      ),
    );
  }
}
