import 'package:loginproject/config/api/api_consumer.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';

class SignInRemoteData{
  ApiConsumer api;
  Map<String,dynamic>?data;

  SignInRemoteData({required this.api,this.data});
  Future<SignInEntity> signIn()async {
   final response= await api.post(endPoint: "https://student.valuxapps.com/api/login",
        data:data );
   return SignInEntity.fromJson(response.data);
  }
}