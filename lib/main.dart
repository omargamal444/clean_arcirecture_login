import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginproject/feature/user/data/data_repo/check_login_repo_impl.dart';
import 'package:loginproject/feature/user/data/data_source/loca_data_source/store_token_local.dart';
import 'package:loginproject/feature/user/domain/user_usecase/check_login_usecase.dart';
import 'package:loginproject/feature/user/presentation/controller/binding.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/sign_in_screen.dart';
import 'package:loginproject/feature/user/presentation/credential_pages/sign_up_screen.dart';

import 'feature/user/presentation/credential_pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = CheckLogInUsecase(
        repo: CheckLogInRepoImpl(localDataSource: LocalDataSource())).call();
      return GetMaterialApp(
        initialRoute:isLoggedIn?ProfilePage.profilePage:SignInScreen.signInScreen,
        getPages: [
          GetPage(
              name: SignUpScreen.signUpScreen,
              page: () =>  SignUpScreen(),
              binding: SignUpBinding()),
          GetPage(
              name: SignInScreen.signInScreen,
              page: () => SignInScreen(),
              binding: SignInBinding()),
          GetPage(
              name: ProfilePage.profilePage,
              page: () => const ProfilePage(),
              binding: ProfileBinding()),
        ],
        theme: ThemeData.dark(),
      );

  }
}