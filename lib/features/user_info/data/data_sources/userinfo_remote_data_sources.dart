import 'package:dio/dio.dart';
import '../../../auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserInfo(String accessToken);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUserInfo(String accessToken) async {
    final response = await dio.get(
      'https://dummyjson.com/auth/me',
      options: Options(headers: {
        'Authorization': 'Bearer $accessToken',
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get user info");
    }
  }
}
