import 'package:clean_architecture/features/user_info/data/data_sources/userinfo_remote_data_sources.dart';
import 'package:clean_architecture/features/user_info/data/repositories/userinfo_repo_impl.dart';
import 'package:clean_architecture/features/user_info/domain/repositories/user_repositories.dart';
import 'package:clean_architecture/features/user_info/presentation/providers/user_notifier.dart';
import 'package:clean_architecture/features/user_info/presentation/providers/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/userInfo_use_cases.dart';

final dioProvider = Provider((ref) => Dio());

final userInfoRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref){
  return UserRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final userInfoRepositoryProvider= Provider<UserRepository>((ref){
  return UserRepositoryImpl(remoteDataSource: ref.watch(userInfoRemoteDataSourceProvider));
});

final userInfoUseCase= Provider<UserinfoUseCases>((ref){
  return UserinfoUseCases(ref.watch(userInfoRepositoryProvider));
});

final userInfoNotifierProvider=StateNotifierProvider<UserNotifier, UserState>((ref){
  return UserNotifier(userinfoUseCases: ref.watch(userInfoUseCase));
});
