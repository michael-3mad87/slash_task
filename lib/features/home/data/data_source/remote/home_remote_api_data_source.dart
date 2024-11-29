import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/core/error/exception.dart';
import 'package:slash_task/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:slash_task/features/home/data/models/movie_response2/movie_response2.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteApiDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  const HomeRemoteApiDataSource(this._dio);

  @override
  Future<List<MovieResponse>> getMovies() async {
    try {
      final response = await _dio.get(APIConstants.allMoviesEndPoint);
      final moviesList = response.data as List;

      return moviesList.map((json) => MovieResponse.fromJson(json)).toList();
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      
      } else {
       
      }
      throw RemoteException(message ?? 'Failed to get Movies');
    }
  }
}
