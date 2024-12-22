import 'package:loginproject/config/api/api_const.dart';

class SignInEntity {
String? token;
SignInEntity({required this.token});

factory SignInEntity.fromJson(Map<String,dynamic>data){
  return SignInEntity(token: data[ApiKey.data][ApiKey.token]);
}
}
