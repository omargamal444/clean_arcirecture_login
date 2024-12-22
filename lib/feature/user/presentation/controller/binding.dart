import 'package:get/get.dart';
import 'package:loginproject/feature/user/presentation/controller/profile_controller.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_in_controller.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_up_controller.dart';

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
