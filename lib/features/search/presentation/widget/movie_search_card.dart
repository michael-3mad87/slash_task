import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/resources/color_manger.dart';

import 'package:slash_task/core/widget/error_image.dart';
import 'package:slash_task/core/widget/loading_state.dart';
import 'package:slash_task/features/search/domain/entity/search_movie.dart';

class MovieSearchCard extends StatelessWidget {
  final SearchMovie movie;
  const MovieSearchCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: movie.image ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const LoadingState(),
                errorWidget: (context, url, error) => ErrorImage(
                  height: 90.h,
                  width: 140.w,
                ),
                height: 90.h,
                width: 140.w,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.summary ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          height: 1.5,
                          fontSize: 15.sp,
                          color: ColorManager.lightGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
