import 'package:emeron/features/auth/domain/entities/token.entity.dart';

abstract class IAuthenticateWithFirebaseUserUseCase {
  Future<dynamic> call(String login, String password);
}
