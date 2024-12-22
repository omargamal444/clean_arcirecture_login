import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';

class SignInModel extends SignInEntity{
String?status;
Data?data;

SignInModel({required this.status, this.data,required super.token});
}
class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;
  String?credit;
  String ?points;

  Data(
      {required this.name,
        required this.email,
        required this.phone,
        required this.id,
        required this.image,
        required this.token
      ,required this.credit,
      required this.points});
}