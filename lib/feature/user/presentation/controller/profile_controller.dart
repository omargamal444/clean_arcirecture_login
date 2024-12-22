import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ProfileController extends GetxController{
 final RxBool _isLoading=false.obs;
 bool get isLoading=>_isLoading.value;
Future<void> logOut()async{
 _isLoading.value=true;
 final box= Hive.box("token");
 Future.delayed(const Duration(seconds: 10));
await box.delete("token");
_isLoading.value=false;
}
}