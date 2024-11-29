import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/core/error/exception.dart';
import 'package:slash_task/features/home/data/models/movie_response2/movie_response2.dart';
import 'package:slash_task/features/search/data/data_source/search_remote_data_source.dart';

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteApiDataSource implements SearchRemoteDataSource {
  final Dio _dio;
  SearchRemoteApiDataSource(this._dio);
  @override
  Future<List<MovieResponse>> getMovies(String query) async {
    try {
      final response = await _dio.get(APIConstants.baseURL,
        queryParameters: {'q': query},
      );
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
