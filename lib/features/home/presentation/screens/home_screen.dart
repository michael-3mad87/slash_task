import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/di/service_locator.dart';
import 'package:slash_task/core/resources/assets_manger.dart';
import 'package:slash_task/core/resources/color_manger.dart';
import 'package:slash_task/core/resources/values_manger.dart';
import 'package:slash_task/core/widget/home_screen_app_bar.dart';
import 'package:slash_task/features/home/presentation/widgets/home_tab.dart';
import 'package:slash_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:slash_task/features/search/presentation/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [const HomeTab(), const SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<SearchCubit>(),
      child: Scaffold(
        appBar: const HomeScreenAppBar(),
        extendBody: false,
        body: tabs[currentIndex],
        bottomNavigationBar: ClipRRect(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) => changeSelectedIndex(value),
              backgroundColor: ColorManager.bottomNavColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorManager.white,
              unselectedItemColor: ColorManager.bottomNavIconColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                CustomBottomNavBarItem(IconsAssets.home, 'Home'),
                CustomBottomNavBarItem(IconsAssets.search, 'Search'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeSelectedIndex(int selectedIndex) =>
      setState(() => currentIndex = selectedIndex);
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String iconPath;
  final String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            radius: Sizes.s16,
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.bottomNavColor,
              size: Sizes.s18,
            ),
          ),
        );
}
