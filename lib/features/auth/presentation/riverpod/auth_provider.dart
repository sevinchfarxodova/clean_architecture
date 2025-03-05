import 'package:clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture/features/auth/data/repository/auth_repo_imp.dart';
import 'package:clean_architecture/features/auth/domain/repositories/auth_repositories.dart';
import 'package:clean_architecture/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:clean_architecture/features/auth/presentation/riverpod/auth_notifier.dart';
import 'package:clean_architecture/features/auth/presentation/riverpod/auth_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

final authRemoteDataSourceProvider=Provider<AuthRemoteDataSource>((ref){
  return AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final authRepositoryProvider =Provider<AuthRepository>((ref){
  return AuthRepositoryImpl(remoteDataSource: ref.watch(authRemoteDataSourceProvider));
});


final signInUseCaseProvider =Provider<SignInUseCase>((ref){
  return SignInUseCase( ref.watch(authRepositoryProvider));
});

final authNotifierProvider  =StateNotifierProvider<AuthNotifier, AuthState>((ref){
  return AuthNotifier(signInUseCase:  ref.watch(signInUseCaseProvider));
});




