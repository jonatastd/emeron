import 'package:get/get.dart';
import 'package:emeron/core/services/exceptions/api.exceptions.dart';
import 'package:emeron/features/auth/domain/entities/token.entity.dart';
import 'package:emeron/features/auth/domain/repositories/iauth.repository.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_with_firebase_user.usecase.dart';




class AuthenticateWithFirebaseUserUsecaseImpl implements IAuthenticateWithFirebaseUserUseCase {
  final IAuthRepository repository;

  AuthenticateWithFirebaseUserUsecaseImpl(this.repository);

  @override
  Future<dynamic> call(String login, String password) async {
    try {
      var token = await repository.signInWithFirebase(login, password);
      return token;
    } catch (e) {
      throw ApiException(message: 'login_failed_message'.tr);
    }
  }

  
}
