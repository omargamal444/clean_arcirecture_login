import 'package:dio/dio.dart';

handleExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw Exception("connection time out error");
    case DioExceptionType.receiveTimeout:
      throw Exception("recieve time out error");
    case DioExceptionType.connectionError:
      throw Exception("connection error");
    case DioExceptionType.sendTimeout:
      throw Exception("send time out error");
    case DioExceptionType.cancel:
      throw Exception("cancel error");
    case DioExceptionType.unknown:
      throw Exception("unknown error");
    case DioExceptionType.badCertificate:
      throw Exception("bad certificate error");
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 404:
          throw Exception("not found");
        case 500:
          throw Exception("not fond");
      }
  }
}
