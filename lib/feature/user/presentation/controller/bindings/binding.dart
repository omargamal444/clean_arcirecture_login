import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loginproject/feature/user/data/data_repo/sign_up_repo_impl';
import 'package:loginproject/feature/user/data/data_source/remote_data_source/sign_up_remote_data_source.dart';
import 'package:loginproject/feature/user/domain/user_usecase/sign_up_usecase.dart';
import 'package:loginproject/feature/user/presentation/controller/profile_controller.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_in_controller.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_up_controller.dart';

import '../../../../config/api/connection_checker.dart';
import '../../../../config/api/dio_consumer.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
  }
}

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(), fenix: true);
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
class MainBinding implements Bindings{
  @override
  void dependencies() {
    Dio dio= Get.put(Dio(),permanent: true);
    DioConsumer dioConsumer=Get.put(DioConsumer(dio),permanent: true);
   final connection= Get.put(Connection(),permanent: true);
   final signUpRemoteDataSource= Get.put(SignUpRemoteDataSource(api: dioConsumer),permanent: true);
   final signUpRepoImpl=Get.put(SignUpRepoImpl(connection: connection, signUpMethod:signUpRemoteDataSource),permanent: true);
  Get.put(SignUpUseCase(repo: signUpRepoImpl),permanent: true);
  }

}
