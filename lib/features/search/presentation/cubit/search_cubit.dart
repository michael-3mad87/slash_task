

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:slash_task/features/search/domain/entity/search_movie.dart';
import 'package:slash_task/features/search/domain/use_case/get_search_movies.dart';

part 'search_state.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final GetSearchMovies getSearchMovies;

  SearchCubit(this.getSearchMovies) : super(SearchInitial());

  Future<void> getSearchMovie(String query) async {
    emit(SearchLoading());
    final result = await getSearchMovies.call(query);

    result.fold(
      (failure) {
        emit(SearchError(failure.message));
      },
      (movies) {
        emit(SearchSuccess(movies));
      },
    );
  }
}
