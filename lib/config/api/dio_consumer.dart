import 'package:dio/dio.dart';
import 'package:loginproject/config/api/api_consumer.dart';
import 'package:loginproject/config/error/handle_exception.dart';

import '../error/exception.dart';

class DioConsumer extends ApiConsumer {
  Dio dio;
  DioConsumer(this.dio){
    dio.interceptors.add(LogInterceptor(
      error: true,
      responseHeader: true,
      responseBody: true,
      requestHeader: true,
      requestBody: true,
      request: true,
    ));
  }


  @override
  Future delete(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await dio.delete(endPoint,
          data: data, queryParameters: queryParameter);
      if (response.statusCode == 200) {
        if (response.data["status"] == false) {
          throw ServerException(error: ErrorModel.fromJson(response.data));
        }
      }
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }

  @override
  Future get(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await dio.delete(endPoint,
          data: data, queryParameters: queryParameter);
      if (response.statusCode == 200) {
        if (response.data["status"] == false) {
          throw ServerException(error: ErrorModel.fromJson(response.data));
        }
      }
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }

  @override
  Future post(
      {required String endPoint,
      Map<String,dynamic>? data,
      Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.post(endPoint, data: data, queryParameters: queryParameter);
      if (response.statusCode == 200) {
        if (response.data["status"] == false) {
          throw ServerException(error: ErrorModel.fromJson(response.data));}
      }
      return response;
    } on DioException catch (e) {
      handleExceptions(e);

    }
  }

  @override
  Future patch(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameter}) async {
    try {
      final response = await dio.patch(endPoint,
          data: data, queryParameters: queryParameter);
      if (response.statusCode == 200) {
        if (response.data["status"] == false) {
          throw ServerException(error: ErrorModel.fromJson(response.data));
        }
      }
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }
}
