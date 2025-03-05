import 'package:clean_architecture/features/auth/domain/entities/user.dart';
import 'package:clean_architecture/features/auth/domain/repositories/auth_repositories.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> signIn({required String username, required String password}) {
return remoteDataSource.signIn(username: username, password: password);
  }

}
