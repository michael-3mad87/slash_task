import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:slash_task/features/home/domain/entities/movies.dart';
import 'package:slash_task/features/home/domain/use_case/get_movies.dart';

part 'home_state.dart';

@LazySingleton()
class HomeCubit extends Cubit<HomeState> {
  final GetMovies _getMovies;
  HomeCubit(this._getMovies) : super(HomeInitial()) {
    getMovies();
  }
  Future<void> getMovies() async {
    final result = await _getMovies();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (movies) => emit(HomeSuccess(movies)),
    );
  }
}
