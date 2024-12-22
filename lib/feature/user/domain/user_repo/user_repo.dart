import 'package:dartz/dartz.dart';
import 'package:loginproject/config/error/failure.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_up_entity.dart';
abstract class UserRepository{
 Future <Either<SignUpEntity,Failure>> signUpUser();
}
abstract class SignInRepo{
 Future<Either<SignInEntity,Failure>> signInUser();
}
abstract class CheckLogInRepo{
 bool isLoggedIn();
}
