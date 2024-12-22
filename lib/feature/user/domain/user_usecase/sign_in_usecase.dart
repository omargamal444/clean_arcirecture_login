import 'package:dartz/dartz.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';
import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

import '../../../../config/error/failure.dart';

class SignInUseCase{
  SignInRepo repo;

  SignInUseCase({required this.repo});

  Future<Either<SignInEntity,Failure>> call(){
  return repo.signInUser();
  }
}