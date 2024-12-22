class SignUpEntity {
  String? message;

  SignUpEntity({required this.message});

  factory SignUpEntity.fromJson(Map<String, dynamic> data) {
    return SignUpEntity(message: data["message"]);
  }
}
