import 'package:clean_architecture/features/user_info/domain/usecases/userInfo_use_cases.dart';
import 'package:clean_architecture/features/user_info/presentation/providers/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserinfoUseCases userinfoUseCases;

  UserNotifier({required this.userinfoUseCases}) : super(UserInitial());

  Future<void> userInfo(var accessToken) async {
    try {
      state = UserLoading();
      final userInfo = await userinfoUseCases(accessToken: accessToken);
      state = UserSuccess(userInfo);
    } catch (e) {
      state = UserError(e.toString());
    }
  }
}
