import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/di/service_locator.dart';
import 'package:slash_task/core/resources/color_manger.dart';
import 'package:slash_task/core/resources/values_manger.dart';

import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:slash_task/features/home/presentation/widgets/movie_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.black,
        body: BlocProvider(
          create: (_) => serviceLocator.get<HomeCubit>(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                        color: ColorManager.error, fontSize: Sizes.s18),
                  ),
                );
              } else if (state is HomeSuccess) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
                  child: CarouselSlider.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index, realIdx) {
                      return MovieCard(movies: state.movies[index], );
                    },
                    options: CarouselOptions(
                      height: 600.h,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      disableCenter: true,
                      aspectRatio: 16 / 9,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 700),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
