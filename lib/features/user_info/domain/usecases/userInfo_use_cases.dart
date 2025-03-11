import 'package:clean_architecture/features/user_info/domain/repositories/user_repositories.dart';

import '../../../auth/domain/entities/user.dart';

class UserinfoUseCases {
  final UserRepository repository;

  UserinfoUseCases(this.repository);

  Future<User>call({required String accessToken}){
    return repository.getUserInfo(accessToken: accessToken);
  }
}