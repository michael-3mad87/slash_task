import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/resources/assets_manger.dart';
import 'package:slash_task/core/resources/color_manger.dart';
import 'package:slash_task/core/resources/values_manger.dart';
import 'package:slash_task/features/search/presentation/cubit/search_cubit.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      bottom: PreferredSize(
        preferredSize: Size(Sizes.s100.w, Sizes.s60.h),
        child: Padding(
          padding: EdgeInsets.all(Insets.s8.sp),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorManager.white,
                  style: const TextStyle(color: ColorManager.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Insets.s12.w,
                      vertical: Insets.s8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.white,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: const BorderSide(
                        width: Sizes.s1,
                        color: ColorManager.error,
                      ),
                    ),
                    prefixIcon: const ImageIcon(
                      AssetImage(IconsAssets.search),
                      color: ColorManager.white,
                    ),
                    hintText: 'What do you search for?',
                    hintStyle: const TextStyle(
                        color: ColorManager.lightGrey),
                  ),
                   onFieldSubmitted: (query) {
            if (query.isNotEmpty) {
              searchCubit.getSearchMovie(query);
            }
          },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
