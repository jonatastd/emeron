import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emeron/core/services/http/http.service.dart';
import 'package:emeron/core/services/exceptions/api.exceptions.dart';
import 'package:emeron/features/auth/infra/dto/requests/signin_request.dto.dart';
import 'package:emeron/features/auth/infra/dto/responses/user_response.dto.dart';
import 'package:emeron/features/auth/infra/datasource/auth/iauth.datasource.dart';

class AuthDataSourceImpl implements IAuthDatasource {
  final IHttpService _httpService;

  AuthDataSourceImpl(this._httpService);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserResponseDTO> signIn(SignInRequestDTO dto) async {
    try {
      final response = await _httpService.post(
        'https://api-hmg.emeron.edu.br/users/login',
        body: json.encode(
          {
            "email": dto.login,
            "password": dto.password,
          },
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      return UserResponseDTO.fromJson(response.data);
    } catch (e) {
      print(e);
      throw ApiException(message: 'login_failed_message'.tr);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _httpService.post('/auth/logout');
    } catch (e) {
      throw ApiException(message: 'Falha ao realizar logout: ${e.toString()}');
    }
  }

  @override
  Future signInFirebaseEmail(SignInRequestDTO dto) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: dto.login,
        password: dto.password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
