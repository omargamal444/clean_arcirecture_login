import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loginproject/config/api/api_const.dart';
import 'package:loginproject/feature/user/data/data_repo/sign_in_repo_impl.dart';
import 'package:loginproject/feature/user/data/data_source/remote_data_source/sign_in_remote_data_source.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';
import 'package:loginproject/feature/user/domain/user_usecase/sign_in_usecase.dart';
import 'package:loginproject/feature/user/domain/user_usecase/sign_up_usecase.dart';

import '../../../../config/api/connection_checker.dart';
import '../../../../config/api/dio_consumer.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInUseCase? signInUseCase;
  final RxBool _isSuccess = false.obs;
  final RxBool _isLoad = false.obs;
  final RxBool _isLoggedIn = false.obs;

  bool get isSuccess => _isSuccess.value;

  bool get isLoading => _isLoad.value;

  bool get isLoggedIn => _isLoggedIn.value;

  Future<void> signIn() async {
    _isLoad.value = true;
    Future.delayed(const Duration(seconds: 5));
    Map<String, dynamic> data = {
      ApiKey.email: emailController.text.trim(),
      ApiKey.password: passwordController.text
    };
    final result = await signInUseCase!.call();
    _isLoad.value = false;
    result.fold((signInEntity) async {
      return await storeAuthToken(signInEntity);
    },
        (failure) =>
            Get.snackbar("فشل تسجيل الدخول ", "${failure.errorMessage}"));
  }

  storeAuthToken(SignInEntity signInEntity) async {
    final box = Hive.box("token");
    _isSuccess.value = true;
    await box.putAll({"token": signInEntity.token, "isLoggedIn": true});
  }
}
