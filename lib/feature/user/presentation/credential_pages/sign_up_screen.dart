import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginproject/feature/user/presentation/controller/sign_up_controller.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/sign_in_screen.dart';

import '../../../../const.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({super.key});

  static String signUpScreen = "/signup";
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
                sizBoxHeight(100),
                Center(
                    child: Text(
                  "SignUp",
                  style: GoogleFonts.allison(
                      textStyle: const TextStyle(fontSize: 50)),
                )),
                sizBoxHeight(30),
                Stack(
                  children: [
                    const CircleAvatar(
                        radius: 30, child: Icon(Icons.account_circle_sharp)),
                    Positioned(
                        left: 20,
                        top: 25,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_rounded)))
                  ],
                ),
                sizBoxHeight(60),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال الاسم";
                    } else {
                      return null;
                    }
                  },
                  controller: controller.nameController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 20),
                      hintText: "name",
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
                    } else if (value.length < 6) {
                      return "يجب ان تتكون كلمة المرور من ستة احرف او ارقام او رموز على الاقل";
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال كلمة السر";
                    } else {
                      return null;
                    }
                  },
                  controller: controller.phoneController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 20),
                      hintText: "phone",
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
                      controller.isLoading ? null : await controller.signUp();
                      if (controller.isSuccess == true) {
                        Get.snackbar("sucess", "لقد تم تسجيلك بنجاح");
                        Get.offNamed(SignInScreen.signInScreen);
                      }
                    }
                  },
                  child: (Container(
                    width: 330,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const Center(child: Text("sign up")),
                  )),
                ),
                sizBoxHeight(10),
                controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : sizBoxHeight(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already has an account?"),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(SignInScreen.signInScreen);
                        },
                        child: const Text("signIn"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
