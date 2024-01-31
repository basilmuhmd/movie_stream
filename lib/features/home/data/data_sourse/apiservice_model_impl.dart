import 'package:dio/dio.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/api_constents/api_constants.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/data_sourse/apiservise_data_sourse.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/movie_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'apiservice_model_impl.g.dart';

class ApiServiceDataSourseImpl implements ApiServiceDataSourse {
  static final dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<MovieModel?> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(ApiConstants.apiPath);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getPopular() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(ApiConstants.popularPath);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getUpcoming() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(ApiConstants.upcomingPath);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getToprated() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }
}

@riverpod
ApiServiceDataSourse apiServiceDataSourse(ApiServiceDataSourseRef ref) {
  return ApiServiceDataSourseImpl();
}
