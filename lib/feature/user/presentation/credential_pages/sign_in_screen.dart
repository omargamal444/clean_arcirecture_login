import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_in_controller.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/profile_page.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/sign_up_screen.dart';

import '../../../../const.dart';

class SignInScreen extends GetView<SignInController> {
  SignInScreen({super.key});

  static String signInScreen = "/signin";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: _formKey,
            child: Column(
              children: [
                sizBoxHeight(150),
                Center(
                    child: Text(
                  "Sign In",
                  style: GoogleFonts.allison(
                      textStyle: const TextStyle(fontSize: 80)),
                )),
                controller.isLoading
                    ? const SizedBox(
                        height: 150,
                        child: Center(child: CircularProgressIndicator()))
                    : sizBoxHeight(200),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال الايميل";
                    } else {
                      return null;
                    }
                  },
                  controller: controller.emailController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 20),
                      hintText: "email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid))
                      //border: const OutlineInputBorder()
                      ),
                ),
                sizBoxHeight(25),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال الايميل";
                    } else {
                      return null;
                    }
                  },
                  controller: controller.passwordController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 20),
                      hintText: "password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid))
                      //border: const OutlineInputBorder()
                      ),
                ),
                sizBoxHeight(25),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      controller.isLoading ? null : await controller.signIn();
                      if (controller.isSuccess) {
                        Get.snackbar("success", "تم تسجيل دخول المستخدم بنجاح");
                        Get.offNamed(ProfilePage.profilePage);
                      }
                    }
                  },
                  child: (Container(
                    width: 330,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const Center(child: Text("sign in")),
                  )),
                ),
                sizBoxHeight(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("dont have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(SignUpScreen.signUpScreen);
                        },
                        child: const Text("signUp"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
