import 'package:loginproject/config/api/api_consumer.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_up_entity.dart';

class RemoteDataSource {
  ApiConsumer api;
  final Map<String, dynamic>? data;

  RemoteDataSource({required this.api, this.data});

  Future<SignUpEntity> signUp() async {
    final response = await api.post(
        endPoint: "https://student.valuxapps.com/api/register", data: data);

    return SignUpEntity.fromJson(response.data);
  }
}
