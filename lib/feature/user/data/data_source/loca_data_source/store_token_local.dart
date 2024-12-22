import 'package:hive/hive.dart';

class LocalDataSource{
  checkLoginState (){
   final box= Hive.box("token");
 final response= box.get("token");
 return response;
  }
}