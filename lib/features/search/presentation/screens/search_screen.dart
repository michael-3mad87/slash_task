import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/widget/error_message.dart';
import 'package:slash_task/core/widget/loading_state.dart';
import 'package:slash_task/features/search/presentation/cubit/search_cubit.dart';
import 'package:slash_task/features/search/presentation/widget/movie_search_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: LoadingState(),
            );
          } else if (state is SearchError) {
            return ErrorMessageWidget(message: 
              state.message,
              
            );
          } else if (state is SearchSuccess) {
            final movies = state.searchMovie;
            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  'No movies found!',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }
            return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieSearchCard(movie: movies[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        color: Colors.grey,
        width: double.infinity,
        height: 2.h,
      ),
    );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
