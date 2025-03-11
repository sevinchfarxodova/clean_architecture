import '../../../auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserInfo({ required String accessToken});
}
