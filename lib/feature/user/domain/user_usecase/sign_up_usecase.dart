import 'package:dartz/dartz.dart';
import 'package:loginproject/config/error/failure.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_up_entity.dart';
import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

class SignUpUseCase {
  UserRepository repo;

  SignUpUseCase({required this.repo});

  Future<Either<SignUpEntity, Failure>> call() {
    return repo.signUpUser();
  }
}
