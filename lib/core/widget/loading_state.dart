import 'package:flutter/material.dart';
import 'package:slash_task/core/resources/assets_manger.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImageAssets.loadingImage));
  }
}