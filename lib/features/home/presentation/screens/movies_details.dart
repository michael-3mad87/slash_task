import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/resources/color_manger.dart';
import 'package:slash_task/features/home/domain/entities/movies.dart';
import 'package:slash_task/features/home/presentation/widgets/back_ground_stack.dart';
import 'package:slash_task/features/home/presentation/widgets/container_genre_widget.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movies;

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 350.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 15),
              title: Text(
                movie.name ?? '',
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: BackgroundStack(image: movie.image ?? ''),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (movie.premiered != null)
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                size: 16.sp, color: Colors.grey),
                            SizedBox(width: 5.w),
                            Text(
                              movie.premiered ?? '',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      if (movie.rating != null)
                        Row(
                          children: [
                            Icon(Icons.star, size: 18.sp, color: Colors.yellow),
                            SizedBox(width: 5.w),
                            Text(
                              "${movie.rating}",
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  
                  if (movie.genres != null && movie.genres!.isNotEmpty)
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: movie.genres!
                          .map(
                              (genre) => ContainerGenreWidget(genreName: genre))
                          .toList(),
                    ),
                  SizedBox(height: 20.h),

                  // Overview Section
                  Text(
                    "Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    movie.summary ?? "No description available.",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14.sp,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
