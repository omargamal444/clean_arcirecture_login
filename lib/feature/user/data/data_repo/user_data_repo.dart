import 'package:dartz/dartz.dart';
import 'package:loginproject/config/api/connection_checker.dart';
import 'package:loginproject/config/error/exception.dart';
import 'package:loginproject/config/error/failure.dart';
import 'package:loginproject/feature/user/data/data_source/remote_data_source/sign_up_method.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_up_entity.dart';
import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

class SignUpRepoImpl extends UserRepository {
  Connection? connection;
  RemoteDataSource? signUpMethod;

  SignUpRepoImpl({required this.connection, required this.signUpMethod});

  @override
  Future<Either<SignUpEntity, Failure>> signUpUser() async {
    if (await connection!.isConnected) {
      try {
        final signUpModel = await signUpMethod!.signUp();
        return left(signUpModel);
      } on ServerException catch (e) {
        return right(Failure(errorMessage: e.error.message));
      } on Exception catch (e) {
        return right(Failure(errorMessage: e.toString()));
      }
    } else {
      return right(Failure(errorMessage: "no internet connection"));
    }
  }
}
