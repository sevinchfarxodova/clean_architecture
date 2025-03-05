import 'package:clean_architecture/features/auth/domain/entities/user.dart';
import 'package:clean_architecture/features/auth/domain/repositories/auth_repositories.dart';

class SignInUseCase{
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call({required String username, required String password}){
    return repository.signIn(username: username, password: password);
  }
}