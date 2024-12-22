class ServerException implements Exception {
  ErrorModel error;

  ServerException({required this.error});
}

class ErrorModel {
  bool? status;
  String? message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> data) {
    return ErrorModel(status: data['status'], message: data['message']);
  }
}
