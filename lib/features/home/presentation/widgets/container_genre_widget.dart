import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/resources/color_manger.dart';


class ContainerGenreWidget extends StatelessWidget {
  const ContainerGenreWidget({
    super.key,
    required this.genreName,
  });
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: ColorManager.white,
          width: 1.w,
        ),
      ),
      child: Text(
        genreName,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color:Colors.white, fontSize: 10),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
