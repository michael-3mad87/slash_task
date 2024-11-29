import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
 const ErrorImage({required this.height, required this.width, super.key});
  final double width;
 final  double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
      width: width,
      height: height,
    );
  }
}