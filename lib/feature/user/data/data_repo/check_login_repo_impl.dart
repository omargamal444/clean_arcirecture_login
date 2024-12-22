import 'package:loginproject/feature/user/domain/user_repo/user_repo.dart';

import '../data_source/loca_data_source/store_token_local.dart';

class CheckLogInRepoImpl implements CheckLogInRepo {
  LocalDataSource? localDataSource;

  CheckLogInRepoImpl({this.localDataSource});

  @override
  bool isLoggedIn() {
    final response = localDataSource!.checkLoginState();
    if (response == null) {
      return false;
    } else {
      return true;
    }
  }
}
