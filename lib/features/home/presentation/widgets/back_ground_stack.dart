import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/resources/color_manger.dart';

import 'package:slash_task/core/widget/error_image.dart';
import 'package:slash_task/core/widget/loading_state.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (_, __) => const LoadingState(),
              errorWidget: (_, __, ___) =>
                  const ErrorImage(height: 600, width: 400),
              width: double.infinity,
              height: 350.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 350.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.black.withOpacity(0.0),
                  ColorManager.black.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
