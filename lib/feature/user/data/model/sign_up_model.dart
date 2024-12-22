import 'package:loginproject/feature/user/domain/user_entity/sign_up_entity.dart';

class SignUModel extends SignUpEntity {
  bool? status;
  Data? data;

  SignUModel(
      {required this.status,required super.message, required this.data});}

class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  Data(
      {required this.name,
      required this.email,
      required this.phone,
      required this.id,
      required this.image,
      required this.token});
}
