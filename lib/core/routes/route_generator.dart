import 'package:flutter/material.dart';
import 'package:slash_task/core/routes/routes.dart';
import 'package:slash_task/features/home/presentation/screens/home_screen.dart';
import 'package:slash_task/features/home/presentation/screens/movies_details.dart';
import 'package:slash_task/features/search/presentation/screens/search_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
     
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
        case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => const MoviesDetails(),
          settings: settings,
        );
      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
          settings: settings,
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
