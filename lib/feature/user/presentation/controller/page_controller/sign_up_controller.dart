import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loginproject/config/api/api_const.dart';
import 'package:loginproject/feature/user/data/data_repo/sign_up_repo_impl';
import 'package:loginproject/feature/user/data/data_source/remote_data_source/sign_up_remote_data_source.dart';
import 'package:loginproject/feature/user/domain/user_usecase/sign_up_usecase.dart';

import '../../../../config/api/connection_checker.dart';
import '../../../../config/api/dio_consumer.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final RxBool _isSuccess = false.obs;
  final RxBool _isLoad = false.obs;
  final RxBool _isLoggedIn = false.obs;

  bool get isSuccess => _isSuccess.value;

  bool get isLoading => _isLoad.value;

  bool get isLoggedIn => _isLoggedIn.value;

  Future<void> signUp() async {
    _isLoad.value = true;
    Future.delayed(const Duration(seconds: 5));
    Map<String, dynamic> data = {
      ApiKey.email: emailController.text.trim(),
      ApiKey.password: passwordController.text,
      ApiKey.phone: phoneController.text,
      ApiKey.name: nameController.text,
    };
    final result = await SignUpUseCase(
            repo: SignUpRepoImpl(
                signUpMethod:
                    SignUpRemoteDataSource(api:DioConsumer(Dio()), data: data),
                connection: Connection()))
        .call();
    _isLoad.value = false;
    result.fold((signInEntity) async {
    _isSuccess.value=true;
    },
        (failure) =>
            Get.snackbar("فشل تسجيل المستخدم ", "${failure.errorMessage}"));
  }
}
