import 'package:emeron/core/services/exceptions/api.exceptions.dart';
import 'package:emeron/features/auth/domain/repositories/iauth.repository.dart';
import 'package:emeron/features/auth/domain/usecases/logout_user.usecase.dart';
import 'package:get/get.dart';

class LogoutUserUseCaseImpl implements ILogoutUserUseCase {
  final IAuthRepository repository;

  LogoutUserUseCaseImpl(this.repository);

  @override
  Future<void> call() async {
    try {
      await repository.signOut();
    } catch (e) {
      throw ApiException(message: 'logout_failed_message'.tr);
    }
  }
}
