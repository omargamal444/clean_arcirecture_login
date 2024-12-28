import 'package:dartz/dartz.dart';
import 'package:loginproject/config/api/connection_checker.dart';
import 'package:loginproject/config/error/exception.dart';
import 'package:loginproject/config/error/failure.dart';
import 'package:loginproject/feature/user/data/data_source/remote_data_source/sign_in_remote_data_source.dart';
import 'package:loginproject/feature/user/domain/user_entity/sign_in_entity.dart';
import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

class SignInDataRepo extends SignInRepo {
  Connection?connection;
  SignInRemoteData?signInRemoteData;


  SignInDataRepo({required this.connection, required this.signInRemoteData});

  @override
  Future<Either<SignInEntity, Failure>> signInUser() async {
    try {
      if (await connection!.isConnected) {
     final signInEntity= await signInRemoteData!.signIn();
     return left(signInEntity);
      }
      else {
        return (right(Failure(errorMessage: "No internet connection"),));
      }

    }on ServerException catch (e){
      return right(Failure(errorMessage: "${e.error.message}"));
    }
    on Exception catch (e){
      return right(Failure(errorMessage: "$e"));
    }
  }

}
