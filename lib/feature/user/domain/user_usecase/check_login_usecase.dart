import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

class CheckLogInUsecase{
  CheckLogInRepo? repo;

  CheckLogInUsecase({required this.repo});

  bool call(){
   return repo!.isLoggedIn();
  }
}