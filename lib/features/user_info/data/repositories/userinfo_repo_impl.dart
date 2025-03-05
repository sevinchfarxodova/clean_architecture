import 'package:clean_architecture/features/auth/data/models/user_model.dart';
import '../../domain/repositories/user_repositories.dart';
import '../data_sources/userinfo_remote_data_sources.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserModel> getUserInfo(String accessToken) {
    return remoteDataSource.getUserInfo(accessToken);
  }
}
