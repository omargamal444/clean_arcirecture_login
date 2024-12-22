import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginproject/feature/user/presentation/controller/profile_controller.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/sign_in_screen.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});
static const profilePage="/profile";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Obx(
      () =>Column(
        mainAxisAlignment: MainAxisAlignment.center,children: [
       const Text("profile page"),
        controller.isLoading?const CircularProgressIndicator():
        Center(
          child: ElevatedButton(onPressed: ()async{
              await controller.logOut();
              Get.offNamed(SignInScreen.signInScreen);
            }, child: const Text("LogOut")),
        )
      ],),
    ),);
  }
}
